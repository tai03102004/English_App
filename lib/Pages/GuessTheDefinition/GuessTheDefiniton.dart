import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class Guessthedefiniton extends StatefulWidget {
  final List<Map<String, String>> words;

  Guessthedefiniton({required this.words});

  @override
  State<Guessthedefiniton> createState() => _GuessthedefinitonState();
}

class _GuessthedefinitonState extends State<Guessthedefiniton> {
  final TextEditingController _controller = TextEditingController();
  late String currentWord;
  late String currentDefinition;
  bool _isAnswered = false;
  int numOfCorrectAnswers = 0;
  int numOfIncorrectAnswers = 0;
  int currentIndex = 0;
  String? feedbackMessage;

  void loadWord() {
    currentWord = widget.words[currentIndex]['word']!;
    currentDefinition = widget.words[currentIndex]['definition']!;
      feedbackMessage = null;


  }

  void _checkAnswer() {
    setState(() {
      //_isAnswered = true;
      if (_controller.text.trim().toLowerCase() == currentWord.toLowerCase()) {
        feedbackMessage = "✅ Correct! Well done!";
        numOfCorrectAnswers++;
      } else {
        feedbackMessage = "❌ Incorrect. The correct word was: $currentWord";
        numOfIncorrectAnswers++;
      }
    });
    Future.delayed(Duration(seconds: 2), () {
      if (currentIndex < widget.words.length - 1) {
        setState(() {
          currentIndex++;
          loadWord();
          _controller.clear();
          //_isAnswered = false;
        });
      } else {
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) => AlertDialog(
            title: Text("🎉 Quiz Complete!"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "You've completed the quiz!",
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 10),
                Text(
                  "Correct Answers: $numOfCorrectAnswers",
                  style: TextStyle(color: Colors.green, fontSize: 18),
                ),
                Text(
                  "Incorrect Answers: $numOfIncorrectAnswers",
                  style: TextStyle(color: Colors.red, fontSize: 18),
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pop(context);
                },
                child: Text("Thoát"),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  setState(() {
                    currentIndex = 0;
                    numOfCorrectAnswers = 0;
                    numOfIncorrectAnswers = 0;
                    loadWord();
                    _controller.clear();
                  });
                },
                child: Text("Restart"),
              ),
            ],
          ),
        );
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {}); // Trigger UI updates
    });
    loadWord();
  }

  @override
  void dispose() {
    _controller.dispose(); // Clean up controller resources
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Kiểm tra từ',
          style:
              TextStyle(fontFamily: 'rubik', fontSize: 20, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Color(0xffF76C6C),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            LinearPercentIndicator(
              lineHeight: 15.0,
              percent: (numOfCorrectAnswers) / widget.words.length,
              progressColor: Colors.greenAccent,
              backgroundColor: Colors.grey.shade300,
              animation: true,
              animationDuration: 500,
              center: Text(
                "${((currentIndex / widget.words.length) * 100).toInt()}%",
                style: TextStyle(fontSize: 10, color: Colors.black),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Từ này có nghĩa là gì? ',
              style: TextStyle(
                color: Colors.brown,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              currentDefinition,
              style: TextStyle(
                fontFamily: 'Rubik',
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.teal,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 30),
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: "Nhập từ tiếng Anh...",
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.grey.shade100,
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
                foregroundColor: Colors.white,
              ),
              onPressed: _controller.text.isNotEmpty
                  ? _checkAnswer // Enable only when text is entered and not answered
                  : null, // Disable button
              icon: Icon(Icons.check),
              label: Text("Check Answer"),
            ),
            SizedBox(height: 20),
            if (feedbackMessage != null)
              Text(
                feedbackMessage!,
                style: TextStyle(
                  color: feedbackMessage!.startsWith("✅")
                      ? Colors.green
                      : Colors.red,
                  fontSize: 18,
                ),
                textAlign: TextAlign.center,
              ),
            Spacer(),
            Text(
              "Correct: $numOfCorrectAnswers   Incorrect: $numOfIncorrectAnswers",
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey.shade800,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
