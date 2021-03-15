import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'What is the color of a whale?',
      'Answer': [
        {'text': 'Blue', 'score': 1},
        {'text': 'Black', 'score': 0},
        {'text': 'Red', 'score': 0},
      ],
    },
    {
      'questionText': 'What is 2+2*4?',
      'Answer': [
        {'text': '11', 'score': 0},
        {'text': '12', 'score': 0},
        {'text': '10', 'score': 1},
      ],
    },
    {
      'questionText':
          'What is the name of the famous yellow-electric-mouse pokemon?',
      'Answer': [
        {'text': 'Agumon', 'score': 0},
        {'text': 'Pikachu', 'score': 1},
        {'text': 'Paimon', 'score': 0},
      ],
    }
  ];
  var _questionIndex = 0;
  var _totalscore = 0;

  void _reset() {
    setState(() {
      _questionIndex = 0;
      _totalscore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalscore = _totalscore + score;
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    if (_questionIndex < _questions.length) {
      print("we have more question");
    }

    print('button clicked');
  }

  Widget build(BuildContext) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Are you smart?'),
          centerTitle: true,
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalscore, _reset),
      ),
    );
  }
}
