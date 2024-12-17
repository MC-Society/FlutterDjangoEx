import 'package:flutter/material.dart';
import 'package:flutter_prac/model/api_adapter.dart';
import 'package:flutter_prac/model/model_quiz.dart';
import 'package:flutter_prac/screen/screen_quiz.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Quiz> quizs = [];
  bool isLoading = false;

  _fetchQuizs() async {
    setState(() {
      isLoading = true;
    });
    final response = await http.get(Uri.parse("http://10.0.2.2:8000/quiz/3/"));
    if (response.statusCode == 200) {
      setState(() {
        isLoading = false;
        quizs = parseQuizs(utf8.decode(response.bodyBytes));
      });
    } else {
      throw Exception('failed to load data');
    }
  }
  // List<Quiz> quizs = [
  //   Quiz.fromMap({
  //     'title': 'test',
  //     'candidates': ['a', 'b', 'c', 'd'],
  //     'answer': 0
  //   }),
  //   Quiz.fromMap({
  //     'title': 'test',
  //     'candidates': ['a', 'b', 'c', 'd'],
  //     'answer': 0
  //   }),
  //   Quiz.fromMap({
  //     'title': 'test',
  //     'candidates': ['a', 'b', 'c', 'd'],
  //     'answer': 0
  //   }),
  // ];

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double width = screenSize.width;
    double height = screenSize.height;

    return PopScope(
        canPop: false,
        child: SafeArea(
            child: Scaffold(
                appBar: AppBar(
                  title: Text('My Quiz App'),
                  backgroundColor: Colors.deepPurple,
                  leading: Container(),
                ),
                body: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Center(
                        child: Image.asset(
                          'images/quiz.jpeg',
                          width: width * 0.8,
                        ),
                      ),
                      Padding(padding: EdgeInsets.all(width * 0.024)),
                      Text(
                        '플러터 퀴즈 앱',
                        style: TextStyle(
                            fontSize: width * 0.065,
                            fontWeight: FontWeight.bold),
                      ),
                      Padding(padding: EdgeInsets.all(width * 0.048)),
                      _buildStep(width, '1. 랜덤으로 나오는 퀴즈 3개를 풀어보세요'),
                      _buildStep(
                          width, '2. 문제를 잘 읽고, 정답을 고른 뒤\n다음 문제 버튼을 눌러주세요.'),
                      _buildStep(width, '3. 만점 ㄱㄱ'),
                      Padding(padding: EdgeInsets.all((width * 0.048))),
                      Container(
                          padding: EdgeInsets.only(bottom: width * 0.036),
                          child: Center(
                            child: ButtonTheme(
                              minWidth: width * 0.8,
                              height: height * 0.05,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              child: ElevatedButton(
                                child: Text('지금 퀴즈 풀기',
                                    style: TextStyle(color: Colors.white)),
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.deepPurple,
                                    foregroundColor: Colors.white),
                                onPressed: () {
                                  _fetchQuizs().whenComplete(() {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => QuizScreen(
                                                  quizs: quizs,
                                                )));
                                  });
                                },
                              ),
                            ),
                          ))
                    ]))));
  }

  Widget _buildStep(double width, String title) {
    return Container(
      padding: EdgeInsets.fromLTRB(
          width * 0.048, width * 0.024, width * 0.048, width * 0.024),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Icon(Icons.check_box, size: width * 0.04),
          Padding(padding: EdgeInsets.only(right: width * 0.024)),
          Text(title),
        ],
      ),
    );
  }
}