import 'package:flutter/material.dart';
import 'package:app/helpers/dbHelper.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false, home: Scaffold(body: Dictionary()));
  }
}

class Dictionary extends StatefulWidget {
  const Dictionary({super.key});

  @override
  State<Dictionary> createState() => _DictionaryState();
}

class _DictionaryState extends State<Dictionary> {
  @override
  Widget build(BuildContext context) {
    return SearchPage();
  }
}

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final _controller = TextEditingController();
  List<String> _suggestions = [];
  Word? _searchResult = null;
  bool _isLoading = false;

  void _searchWord() async {
    setState(() {
      _searchResult = null;
      _suggestions = []; // Clear suggestions when searching
      _isLoading = true; // Show loading indicator
    });

    String query = _controller.text.toLowerCase();
    if (query.isNotEmpty) {
      Word? result = await Word.search(query);
      setState(() {
        _isLoading = false;
        if (result != null) {
          _searchResult = result;
        } else {
          _searchResult = null;
        }
      });
    }
  }

  // New method to update suggestions based on user input
  void _updateSuggestions(String query) async {
    _searchResult = null;
    if (query.isNotEmpty) {
      // Fetch suggestions from the database
      List<String> suggestions = await Word.Suggestions(query);
      setState(() {
        _suggestions = suggestions; // Update the suggestions state
      });
    } else {
      // Clear suggestions if the query is empty
      setState(() {
        _suggestions = [];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Tra cứu từ vựng")),
        actions: [
          IconButton(
            icon: Icon(Icons.history),
            onPressed: () {
              // Navigate to History Screen
            },
          ),
          IconButton(
            icon: Icon(Icons.bookmark),
            onPressed: () {
              // Navigate to Bookmarked Words
            },
          ),
        ],
        backgroundColor: Color(0xFF81C784),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: 'Enter a word...',
                border: OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: _searchWord,
                ),
              ),
              onChanged: _updateSuggestions,
              onSubmitted: (text) => _searchWord(),
            ),

            SizedBox(height: 20),
            Expanded(
              child: Stack(
                children: [
                  if (!_isLoading && _searchResult != null)
                    ListView(
                      children: [
                        Text(
                          _searchResult!.definition,
                          style: TextStyle(
                            fontFamily: 'Rubik',
                            fontSize: 25,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          "/${_searchResult!.pronounce}/ ",
                          style: TextStyle(fontSize: 18),
                        ),
                        Text(
                          "${_searchResult!.eDefinition}",
                          style: TextStyle(fontSize: 18),
                        ),
                        SizedBox(height: 10),

                        SizedBox(height: 10),
                        Text(
                          "Example: ${_searchResult!.example}",
                          style: TextStyle(fontSize: 18, fontStyle: FontStyle.italic),
                        ),
                        SizedBox(height: 10),
                        Text(
                          "Synonyms: ${_searchResult!.synonyms}",
                          style: TextStyle(fontSize: 18),
                        ),
                        SizedBox(height: 10),
                        Text(
                          "Type: ${_searchResult!.type}",
                          style: TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                  // Suggestions overlay, shown only when there are suggestions
                  if (_suggestions.isNotEmpty)
                    ListView.builder(
                      itemCount: _suggestions.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(_suggestions[index]),
                          onTap: () {
                            // Set the selected suggestion in the search field
                            _controller.text = _suggestions[index];
                            _suggestions.clear(); // Clear suggestions after selection
                            _searchWord(); // Execute search for the selected word
                          },
                        );
                      },
                    ),
                  // Loading indicator, centered in the overlay
                  if (_isLoading)
                    Center(child: CircularProgressIndicator()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Word {
  final String word;
  final String definition;
  final String eDefinition;
  final String example;
  final String synonyms;
  final String pronounce;
  final String audio;
  final String source;
  final String type;

  Word({
    required this.word,
    required this.definition,
    required this.eDefinition,
    required this.example,
    required this.synonyms,
    required this.pronounce,
    required this.audio,
    required this.source,
    required this.type,
  });

  factory Word.fromMap(Map<String, dynamic> map) {
    return Word(
      word: map['source'],
      definition: map['target'],
      eDefinition: map['definition'],
      example: map['example'],
      synonyms: map['synonyms'],
      pronounce: map['pronounce'],
      audio: map['audio'],
      source: map['source'],
      type: map['type'],
    );
  }

  // Method to search for a word in the database
  static Future<Word?> search(String word) async {
    final dbHelper = DatabaseHelper();
    final db = await dbHelper.database;

    // Query the database for the word in the 'bookmark' table
    final List<Map<String, dynamic>> result = await db.query(
      'bookmark',
      where: 'source = ?',
      whereArgs: [word],
    );

    // If no result is found, return null
    if (result.isEmpty) {
      return null;
    }

    // Return the first result as a Word object
    return Word.fromMap(result.first);
  }

  // Method to retrieve a random list of words from the database (for use in games, etc.)
  static Future<List<Word>> getRandomWords(int limit) async {
    final dbHelper = DatabaseHelper();
    List<Map<String, dynamic>> wordMaps = await dbHelper.getRandomWords(limit);

    // Convert the list of Maps into a list of Word objects
    return wordMaps.map((wordMap) => Word.fromMap(wordMap)).toList();
  }

  // Method to update suggestions based on a query
  static Future<List<String>> Suggestions(String query) async {
    List<String> suggestions = [];
    if (query.isNotEmpty) {
      // Fetch suggestions from the database
      final dbHelper = DatabaseHelper();
      final db = await dbHelper.database;

      final List<Map<String, dynamic>> results = await db.query(
        'bookmark',
        where: 'source LIKE ? ',
        whereArgs: ['$query%'],
      );

      suggestions = results
          .map((e) => e['source'] as String)
          .toList(); // Extract the 'source' field for suggestions
    }
    return suggestions;
  }
}
