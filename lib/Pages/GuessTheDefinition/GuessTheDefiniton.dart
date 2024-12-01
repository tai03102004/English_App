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
  int currentIndex = 0;
  void loadWord(){
    currentWord = widget.words[currentIndex]['word']!;
    currentDefinition = widget.words[currentIndex]['definition']!;
  }
  void _checkAnswer(){
    setState(() {
      _isAnswered = true;

    });
    Future.delayed(Duration(microseconds: 500),(){
      if(currentIndex< widget.words.length-1){
        setState(() {
          currentIndex++;
          if(_controller.text.toLowerCase() == currentWord.toLowerCase()){
            numOfCorrectAnswers++;
          }
          loadWord();
          _controller.clear();
        });
      } else{
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text("🎉 Quiz Complete!"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "You've answered $numOfCorrectAnswers out of ${widget.words.length} correctly.",
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
  void initState() {
    super.initState();
    loadWord();
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
              lineHeight: 8.0,
              percent: (numOfCorrectAnswers) / widget.words.length,
              progressColor: Colors.greenAccent,
              backgroundColor: Colors.grey.shade300,
              animation: true,
              animationDuration: 0,
            ),
            Text('Từ này có nghĩa là gì '),
            SizedBox(height: 30),
            Text(
              currentDefinition,
              style: TextStyle(
                fontFamily: 'Rubik',
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.brown,
              ),
            ),
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: "Type the definition here",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _checkAnswer,
              child: Text("Submit"),
            ),



          ],
        ),
      ),
    );
  }
}
