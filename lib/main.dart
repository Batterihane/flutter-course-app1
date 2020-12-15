import 'package:flutter/material.dart';
import './questions.dart';
import './answer.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // _ means private
  var _questionIndex = 0;
  var questions = [
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
        body: Column(
          children: [
            Question(questions[_questionIndex]["questionText"]),
            ...createAnswerWidgets()
          ]
        ),
      ),
    );
  }

  List<Answer> createAnswerWidgets() {
    return (questions[_questionIndex]["answers"] as List<String>).map((answer)
          {
            return Answer(answer, _answerQuestion);
          }).toList();
  }

  void _answerQuestion() {
    setState(() {
      _questionIndex++;
    });
  }
}
