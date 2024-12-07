import 'package:app/Components/HomeTopButton.dart';
import 'package:app/Pages/GuessTheDefinition/GuessTheDefiniton.dart';
import 'package:app/Pages/MultipleChoice/MultipleChoice.dart';
import 'package:app/Widgets/Home/Topics/TopicChips.dart';
import 'package:app/helpers/dbHelper.dart';
import 'package:flutter/material.dart';

import '../../../Data/Home/data_home.dart';
import '../../Flashcard/Flashcard.dart';
import '../../News/app_rounded_button.dart';

class Topic extends StatefulWidget {
  final String topic;

  const Topic({Key? key, required this.topic}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _Topic createState() => _Topic();
}

class _Topic extends State<Topic> {
  List<Map<String, String>> words = [];

  @override
  void initState() {
    super.initState();
    DatabaseHelper().loadWords(widget.topic).then((loadedWords) {
      setState(() {
        words = loadedWords;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeTopButton(topic: widget.topic),
      backgroundColor: Colors.brown,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: FlashcardList(words: words),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: [
                    _buildTestButton(
                      "Kiểm tra nghĩa",
                      Icons.translate,
                      Colors.green,
                      () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TestPage(words: words),
                        ),
                      ),
                    ),
                    SizedBox(height: 12),
                    _buildTestButton(
                      "Kiểm tra từ",
                      Icons.spellcheck,
                      Colors.blue,
                      () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Guessthedefiniton(words: words),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            TopicChips(currentTopic: widget.topic, levels: levels),

          ],
        ),
      ),
    );
  }
}

Widget _buildTestButton(
    String title, IconData icon, Color color, VoidCallback onTap) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 4,
            offset: Offset(2, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(icon, color: Colors.white, size: 28),
              SizedBox(width: 12),
              Text(
                title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Icon(Icons.chevron_right, color: Colors.white, size: 28),
        ],
      ),
    ),
  );
}

