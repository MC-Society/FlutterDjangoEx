import 'package:flutter/material.dart';
import 'package:flutter_prac/model/model_quiz.dart';

class QuizScreen extends StatefulWidget {
  List<Quiz> quizs;
  QuizScreen({required this.quizs});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  List<int> _answers = [-1, -1, -1];
  List<bool> _answerState = [false, false, false, false];

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double width = screenSize.width;
    double height = screenSize.height;
    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.deepPurple,
            body: Center(
                child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.deepPurple)),
              width: width * 0.85,
              height: height * 0.5,
            ))));
  }
}
