import 'dart:convert';

import 'package:app/models/question_model.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class QuestionController extends GetxController {
  // User Interface code
  bool _isAnswered = false;
  bool get isAnswered => _isAnswered;

  int _correctAns = 0;
  int get correctAns => _correctAns;

  int _selectAns = 0;
  int get selectAns => _selectAns;

  int _numOfCorrectAns = 0;
  int get numOfCorrectAns => _numOfCorrectAns;

  final RxInt _questionNumber = 1.obs;
  RxInt get questionNumber => _questionNumber;

  // Admin Screen
  List<Question> _questions = [];
  List<Question> get questions => _questions;

  void loadQuestionFromSharePreferences() async {
    final prefs = await SharedPreferences.getInstance();
    final questionJson = prefs.getStringList("questions") ?? [];

    _questions = questionJson
        .map((json) => Question.fromJson(jsonDecode(json)))
        .toList();
    update(); 
  }

}
