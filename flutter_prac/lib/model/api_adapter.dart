import 'dart:convert';
import 'model_quiz.dart';

List<Quiz> parseQuizs(String responseBody) {
  final parsed = json.decode(responseBody);
  return parsed.map<Quiz>((json) => Quiz.fromJson(json)).toList();
}
