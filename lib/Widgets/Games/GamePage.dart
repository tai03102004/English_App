import 'package:app/Definitons/size_config.dart';
import 'package:app/Widgets/Games/QuizCategory.dart';
import 'package:flutter/material.dart';

class GamePage extends StatefulWidget {
  const GamePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    AppSizes().init(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Quiz Game"),
        backgroundColor: Color(0xFF7C72E5),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            color: const Color.fromARGB(255, 186, 182, 182),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
              child: QuizCategory(),
            ),
          ),
        ],
      ),
    );
  }
}
