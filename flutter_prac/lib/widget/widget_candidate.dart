import 'package:flutter/material.dart';

class CandWidget extends StatefulWidget {
  VoidCallback tap;
  String text;
  int index;
  double width;
  bool answerState;

  CandWidget(
      {required this.tap,
      required this.text,
      required this.index,
      required this.width,
      required this.answerState});

  @override
  State<CandWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<CandWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width * 0.8,
      height: widget.width * 0.1,
      padding: EdgeInsets.fromLTRB(
        widget.width * 0.048,
        widget.width * 0.024,
        widget.width * 0.048,
        widget.width * 0.024,
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.deepPurple),
          color: widget.answerState ? Colors.deepPurple : Colors.white),
      child: InkWell(
        child: Text(
          widget.text,
          style: TextStyle(
              fontSize: widget.width * 0.035,
              color: widget.answerState ? Colors.white : Colors.black),
        ),
        onTap: () {
          widget.text = 'asdf';
          widget.tap();
        },
      ),
    );
  }
}
