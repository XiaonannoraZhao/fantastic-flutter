import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/result.dart';
import './quiz.dart';
import './result.dart';

void main() {
  runApp(MyApp());
}

//void main() => runApp(MyApp());
class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  static const _questions = [
    {
      'questionText': 'What\'s your favorite person?',
      'answers': [
        {'text': 'Nora', 'score': 1},
        {'text': 'Xiaonan', 'score': 9},
        {'text': 'Mom', 'score': 5},
        {'text': 'Dad', 'score': 7},
        ],
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answers': [
        {'text': 'Rabbit', 'score': 5},
        {'text': 'Dog', 'score': 1},
        {'text': 'Lion', 'score': 10},
        {'text': 'Cat', 'score': 2},
        ],
    },
    {
      'questionText': 'Who\'s your favorite colour?',
      'answers': [
        {'text': 'Red', 'score': 5},
        {'text': 'Green', 'score': 3},
        {'text': 'Black', 'score': 10},
        {'text': 'White', 'score': 2},
      ],
    },
  ];
  var _questionIndex = 0;
  var _totalScore=0;

  void _resetQuiz(){
    setState(() {
      _questionIndex = 0;
       _totalScore=0;
  });}




  void _answerQuestion(int score) {
    //aBool
    _totalScore=_totalScore+score ;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    if (_questionIndex < _questions.length) {
      print('we have more questions!');
    } else {
      print('No more questions!');
      //print(_questionIndex);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore,_resetQuiz),
      ),
    );
  }
}
