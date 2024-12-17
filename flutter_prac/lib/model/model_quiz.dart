class Quiz {
  String title;
  List<String> candidates;
  int answer;

  Quiz(this.title, this.candidates, this.answer);

  Quiz.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        candidates = json['body'].toString().split('/'),
        answer = json['answer'];
}
