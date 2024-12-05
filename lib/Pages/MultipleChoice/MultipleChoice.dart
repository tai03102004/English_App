import 'dart:math';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class TestPage extends StatefulWidget {
  final List<Map<String, String>> words;

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
    //final wordItem = widget.words[questionIndex];
    //currentWord = wordItem['word']!;
    currentWord = widget.words[questionIndex]['word']!;
    //correctDefinition = wordItem['definition']!;
    correctDefinition = widget.words[questionIndex]['definition']!;

    List<String> allDefinitions =
    widget.words.map((item) => item['definition']!).toList();
    allDefinitions.remove(correctDefinition);
    allDefinitions.shuffle(_random);

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
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text("🎉 Quiz Complete!"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "You've answered $numOfCorrectAnswers out of $numOfWords correctly.",
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                //Image.asset("assets/congrats.png", height: 100),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pop(context);
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
      backgroundColor: Color(0xffF7E8D5),
      appBar: AppBar(
        title: Text("Kiểm tra từ vựng"),
        centerTitle: true,
        backgroundColor: Color(0xffF76C6C),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            LinearPercentIndicator(
              lineHeight: 8.0,
              percent: (numOfCorrectAnswers) / numOfWords,
              progressColor: Colors.greenAccent,
              backgroundColor: Colors.grey.shade300,
              animation: true,
              animationDuration: 0,
            ),
            SizedBox(height: 20),
            Text(
              "Question ${questionIndex + 1} / $numOfWords",
              style: TextStyle(
                fontFamily: 'Rubik',
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 40),
            Text(
              currentWord,
              style: TextStyle(
                fontFamily: 'Rubik',
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.brown,
              ),
            ),
            SizedBox(height: 30),
            GridView.count(
              crossAxisCount: 2,
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 10.0,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              children: options.map((option) {
                bool isCorrect = option == correctDefinition;
                return GestureDetector(
                  onTap: isAnswered ? null : () => checkAnswer(option),
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 500),
                    margin: EdgeInsets.all(8),
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: isAnswered
                            ? (isCorrect
                            ? [Colors.greenAccent, Colors.green]
                            : (selectedOption == option
                            ? [Colors.redAccent, Colors.red]
                            : [Colors.white, Colors.grey.shade200]))
                            : [Colors.orangeAccent, Colors.orange],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade400,
                          blurRadius: 4,
                          offset: Offset(2, 4),
                        )
                      ],
                    ),
                    child: Center(
                      child: Text(
                        option,
                        style: TextStyle(
                          color: isAnswered && selectedOption == option
                              ? Colors.white
                              : Colors.black,
                          fontSize: 18,
                          fontFamily: 'Rubik',
                        ),
                        textAlign: TextAlign.center,
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
