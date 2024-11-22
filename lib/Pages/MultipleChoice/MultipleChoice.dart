import 'dart:math';

import 'package:flutter/material.dart';

import '../../Widgets/Home/Topics/Topics.dart';

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
  int numOfWords = 0;
  int questionIndex = 0;
  int numOfCorrectAnswers = 0;
  final _random = Random();
  bool isAnswered = false;
  String? selectedOption;

  @override
  void initState() {
    super.initState();
    loadQuestion();
    numOfWords = widget.words.length;
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

    Future.delayed(Duration(milliseconds: 500), () {
      if (questionIndex < widget.words.length - 1) {
        setState(() {
          questionIndex++;
          if (option == correctDefinition) {
            numOfCorrectAnswers++;
          }
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
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pop(context);  // First pop: closes the dialog.
                  //Navigator.pop(context);
                },
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
      backgroundColor: Color(0xffD3A29D),
      appBar: AppBar(
        title: Text("Quiz Time"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Text(
            //   "What is the definition of:",
            //   style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            // ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Correct: $numOfCorrectAnswers / $numOfWords ",
                  style: TextStyle(
                      color: Colors.white, fontFamily: 'Rubik', fontSize: 15),
                ),
                SizedBox(
                  width: 140,
                ),
                Text(
                  "Question: ${questionIndex + 1} / $numOfWords ",
                  style: TextStyle(
                      color: Colors.white, fontFamily: 'Rubik', fontSize: 15),
                ),
              ],
            ),
            SizedBox(height: 50),
            Center(
              child: Text(
                currentWord,
                style: TextStyle(
                  fontFamily: 'Rubik',
                  fontSize: 35,
                  fontWeight: FontWeight.normal,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 50),
            GridView.count(
              crossAxisCount: 2,
              // Number of items per row
              mainAxisSpacing: 10.0,
              // Space between rows
              crossAxisSpacing: 8.0,
              // Space between columns
              shrinkWrap: true,
              // Let GridView adjust its height
              physics: NeverScrollableScrollPhysics(),
              // Disable scrolling if inside another scrollable widget
              children: options.map((option) {
                bool isCorrect = option == correctDefinition;
                return GestureDetector(
                  onTap: isAnswered ? null : () => checkAnswer(option),
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 8),
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: isAnswered
                          ? (isCorrect
                              ? Colors
                                  .green.shade300 // Correct option turns green
                              : (selectedOption == option
                                  ? Colors.red.shade400
                                  : Color(
                                      0xffE8B298))) // Wrong selected turns red
                          : Color(0xffE8B298),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: isAnswered
                            ? (isCorrect
                                ? Colors.green
                                : Colors.red.withOpacity(0.5))
                            : Colors.white,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        option,
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Rubik',
                            fontSize: 28),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
