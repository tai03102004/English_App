import 'dart:math';

import 'package:flutter/material.dart';

class TestPage extends StatefulWidget {
  final List<Map<String, String>> words; // List of words with definitions

  TestPage({required this.words});

  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  late String currentWord;
  late String correctDefinition;
  late List<String> options;
  int questionIndex = 0;
  final _random = Random();
  bool isAnswered = false;
  String? selectedOption;

  @override
  void initState() {
    super.initState();
    loadQuestion();
  }

  void loadQuestion() {
    // Select the current word
    final wordItem = widget.words[questionIndex];
    currentWord = wordItem['word']!;
    correctDefinition = wordItem['definition']!;

    // Get incorrect definitions
    List<String> allDefinitions =
    widget.words.map((item) => item['definition']!).toList();
    allDefinitions.remove(correctDefinition);
    allDefinitions.shuffle(_random);

    // Combine correct definition with incorrect ones and shuffle
    options = [correctDefinition, ...allDefinitions.take(3)];
    options.shuffle(_random);

    isAnswered = false;
    selectedOption = null;
  }

  void checkAnswer(String option) {
    setState(() {
      isAnswered = true;
      selectedOption = option;
    });

    Future.delayed(Duration(seconds: 2), () {
      if (questionIndex < widget.words.length - 1) {
        setState(() {
          questionIndex++;
          loadQuestion();
        });
      } else {
        // End of questions
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text("Quiz Complete"),
            content: Text("You've completed the quiz!"),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text("OK"),
              ),
            ],
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Quiz Time"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "What is the definition of:",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 12),
            Text(
              currentWord,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.blue),
            ),
            SizedBox(height: 24),
            ...options.map((option) {
              bool isCorrect = option == correctDefinition;
              return GestureDetector(
                onTap: isAnswered ? null : () => checkAnswer(option),
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 8),
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: isAnswered
                        ? (selectedOption == option
                        ? (isCorrect ? Colors.green : Colors.red)
                        : Colors.white)
                        : Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: isAnswered
                          ? (isCorrect
                          ? Colors.green
                          : Colors.red.withOpacity(0.5))
                          : Colors.black54,
                    ),
                  ),
                  child: Text(
                    option,
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
