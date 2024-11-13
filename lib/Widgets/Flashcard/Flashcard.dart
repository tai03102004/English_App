import 'package:flutter/material.dart';
import '../../helpers/dbHelper.dart';
import '../Dictionary/Dictionary.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFFD2B48C),
          title: Center(child: Text('Vocabulary Flashcards')),
          //elevation: 1,
        ),
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(300, 20, 0, 20),
              child: Dictionary(),
            ),
            Expanded(
              // Ensures the FlashcardList takes the available space
              child: FlashcardList(topic: 'abc'),
            ),
          ],
        ),
      ),
    );
  }
}

class FlashcardList extends StatefulWidget {
  final String topic;

  FlashcardList({required this.topic});

  @override
  _FlashcardListState createState() => _FlashcardListState();
}

class _FlashcardListState extends State<FlashcardList> {
  List<Map<String, String>> words = [];

  //List<Topic> topics =[];
  List<Map<String, dynamic>> vocabList = [
    {"word": "Ephemeral", "definition": "Lasting for a very short time"},
    {
      "word": "Ineffable",
      "definition": "Too great or extreme to be expressed in words"
    },
    {
      "word": "Serendipity",
      "definition":
          "The occurrence of events by chance in a happy or beneficial way"
    },
    {
      "word": "Quintessential",
      "definition":
          "Representing the most perfect or typical example of something"
    },
    {
      "word": "Euphoria",
      "definition": "A feeling or state of intense excitement and happiness"
    },
    {
      "word": "Melancholy",
      "definition":
          "A feeling of pensive sadness, typically with no obvious cause"
    },
    {
      "word": "Eloquence",
      "definition": "Fluent or persuasive speaking or writing"
    },
    {
      "word": "Ubiquitous",
      "definition": "Present, appearing, or found everywhere"
    },
    {
      "word": "Aesthetic",
      "definition": "Concerned with beauty or the appreciation of beauty"
    },
    {
      "word": "Reverence",
      "definition": "Deep respect for someone or something"
    },
  ];

  @override
  void initState() {
    super.initState();
    loadWords(widget.topic).then((loadedWords) {
      setState(() {
        words = loadedWords;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    print("Vocab List: $words");
    // Debugging statement
    return words.isEmpty
        ? Center(child: CircularProgressIndicator())
        : Container(
            color: Colors.brown,
            height: 400,
            child: PageView.builder(
              itemCount: words.length,
              itemBuilder: (context, index) {
                final word = words[index];
                if (word['word'] == null || word['definition'] == null) {
                  return Center(child: Text('Invalid vocab entry'));
                }
                return GestureDetector(
                  onTap: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => VocabDetailPage(
                    //       word: word['source'],
                    //       definition: word['target'],
                    //       EDefinition: word['definition'],
                    //       example: word['example'],
                    //       synonyms: word['synonyms'],
                    //       pronounce: word['pronounce'],
                    //       audio: word['audio'],
                    //       source: word['source'],
                    //       type: word['type'],
                    //       //targetLang: word['targetLang'],
                    //     ),
                    //   ),
                    // );
                  },
                  child: Flashcard(
                    word: word['word'] ?? '',
                    definition: word['definition'] ?? '',
                  ),
                );
              },
            ),
          );
  }
}

class Flashcard extends StatefulWidget {
  final String word;
  final String definition;

  Flashcard({required this.word, required this.definition});

  @override
  _FlashcardState createState() => _FlashcardState();
}

class _FlashcardState extends State<Flashcard> {
  bool _isFlipped = false;
  bool _showContent = true;

  void _flipCard() {
    setState(() {
      _isFlipped = !_isFlipped;
    });
    // Delay the appearance of the content (word/definition) by 0.2 seconds
    Future.delayed(Duration(milliseconds: 500), () {
      setState(() {
        _showContent = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _showContent = false;
        _flipCard();
      },
      // Flip the card when tapped
      child: Center(
        child: AnimatedSwitcher(
          duration: Duration(milliseconds: 500), // Animation duration
          transitionBuilder: (Widget child, Animation<double> animation) {
            final rotate = Tween(begin: 0.0, end: 1.0).animate(animation);
            return RotationYTransition(turns: rotate, child: child);
          },
          child: _isFlipped
              ? _buildDefinitionCard() // Show the definition when flipped
              : _buildWordCard(), // Show the word initially
        ),
      ),
    );
  }

  Widget _buildWordCard() {
    return _buildCardContent(widget.word, alignment: Alignment.center);
  }

  Widget _buildDefinitionCard() {
    return _buildCardContent(widget.definition, alignment: Alignment.center);
  }

  Widget _buildCardContent(String text,
      {Alignment alignment = Alignment.center}) {
    return SizedBox(
      key: ValueKey(text), // Unique key for each side of the card
      width: 400,
      height: 300,
      child: Card(
        color: Color(0xFFBDA79B),
        // Light blue background color for flashcards
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Align(
            alignment: alignment,
            child: AnimatedOpacity(
              opacity: _showContent ? 1.0 : 0.0,
              duration: Duration(milliseconds: 200),
              // Fade-in effect for the content
              child: Text(
                text,
                style: TextStyle(fontFamily:'Rubik',fontSize: 40, fontWeight: FontWeight.normal),
                textAlign: alignment == Alignment.center
                    ? TextAlign.center
                    : TextAlign.left,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class RotationYTransition extends AnimatedWidget {
  final Widget child;
  final Animation<double> turns;

  RotationYTransition({required this.turns, required this.child})
      : super(listenable: turns);

  @override
  Widget build(BuildContext context) {
    final angle = turns.value * 3.1415926535897932; // π radians = 180 degrees
    return Transform(
      transform: Matrix4.rotationY(angle),
      alignment: Alignment.center,
      child: angle <
              1.5708 // Show only one side at a time (π / 2 radians = 90 degrees)
          ? child
          : Transform(
              transform: Matrix4.rotationY(3.1415926535897932),
              alignment: Alignment.center,
              child: child,
            ),
    );
  }
}

Future<List<Map<String, String>>> loadWords(String topic) async {
  List<Map<String, String>> wordList = [];

  try {
    // Access the file from assets
    final String fileContent =
        await rootBundle.loadString('assets/data/$topic.txt');
    List<String> lines = fileContent.split('\n');

    for (var line in lines) {
      // Assume each line has the format: word:meaning
      List<String> parts = line.split(':');
      if (parts.length == 2) {
        wordList.add({'word': parts[0].trim(), 'definition': parts[1].trim()});
      }
    }
  } catch (e) {
    print("Error loading file: $e");
  }

  return wordList;
}

// class VocabDetailPage extends StatelessWidget {
//   final String word;
//   final String definition;
//   final String EDefinition;
//   final String example;
//   final String synonyms;
//   final String pronounce;
//   final String audio;
//   final String source;
//   final String type;
//
//   //final String targetLang;
//
// //   VocabDetailPage({
//     required this.word,
//     required this.definition,
//     required this.EDefinition,
//     required this.example,
//     required this.synonyms,
//     required this.pronounce,
//     required this.audio,
//     required this.source,
//     required this.type,
//     //required this.targetLang,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.brown,
//       appBar: AppBar(
//         title: Text('Word Details'),
//         backgroundColor: Colors.green,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: ListView(
//           children: [
//             Text(word,
//                 style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
//             Text('$type', style: TextStyle(fontSize: 18)),
//             SizedBox(height: 10),
//             Text('$definition', style: TextStyle(fontSize: 18)),
//             SizedBox(height: 10),
//             Text('$EDefinition', style: TextStyle(fontSize: 18)),
//             SizedBox(height: 10),
//             Text('Pronunciation: /$pronounce/', style: TextStyle(fontSize: 18)),
//             SizedBox(height: 10),
//             Text('Example: $example', style: TextStyle(fontSize: 18)),
//             SizedBox(height: 10),
//             Text('Synonyms: $synonyms', style: TextStyle(fontSize: 18)),
//             SizedBox(height: 10),
//             SizedBox(height: 10),
//             // Text('Target Language: $targetLang', style: TextStyle(fontSize: 18)),
//             // You can add audio playback functionality here
//           ],
//         ),
//       ),
//     );
//   }
// }
