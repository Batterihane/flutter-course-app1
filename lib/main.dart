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
  var _totalScore = 0;

  // static const _questions = [ // same as below (unmodifiable list that cannot change)
  final _questions = const [
    {
      "questionText": "What's your favorite color?",
      "answers": [
        {"text": "Black", "score": 10},
        {"text": "Green", "score": 5},
        {"text": "Blue", "score": 3},
        {"text": "Red", "score": 1}
      ]
    },
    {
      "questionText": "What's your favorite animal?",
      "answers": [
        {"text": "Dog", "score": 10},
        {"text": "Cow", "score": 6},
        {"text": "Rabbit", "score": 2},
        {"text": "Lion", "score": 1},
        {"text": "Cat", "score": 0}
      ]
    },
    {
      "questionText": "What's your favorite element?",
      "answers": [
        {"text": "Na", "score": 10},
        {"text": "Au", "score": 7},
        {"text": "He", "score": 1}
      ]
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
            : Result(_totalScore),
      ),
    );
  }

  void _answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex++;
    });
  }
}
