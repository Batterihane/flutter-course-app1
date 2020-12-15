import 'package:first_app/result.dart';
import 'package:flutter/material.dart';
// import 'package:first_app/quiz.dart'; same as below
import './quiz.dart';
import './result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // _ means private
  var _questionIndex = 0;

  // static const _questions = [ // same as below (unmodifiable list that cannot change)
  final _questions = const [
    {
      "questionText": "What's your favorite color?",
      "answers": ["Black", "Green", "Blue", "Red"]
    },
    {
      "questionText": "What's your favorite animal?",
      "answers": ["Dog", "Cow", "Rabbit", "Lion", "Cat"]
    },
    {
      "questionText": "What's your favorite element?",
      "answers": ["Na", "Au", "He"]
    },
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        // Scaffold: basic app design
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questions: _questions,
                questionIndex: _questionIndex,
              )
            : Result(),
      ),
    );
  }

  void _answerQuestion() {
    setState(() {
      _questionIndex++;
    });
  }
}
