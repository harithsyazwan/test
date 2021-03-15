import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultscore;
  final Function resetHandler;

  String get resultPhrase {
    var resultText = 'You got it all correct!';
    if (resultscore == 2) {
      resultText = 'You got 2 correct!';
    } else if (resultscore == 1) {
      resultText = 'You only got 1 correct.';
    } else if (resultscore == 0) {
      resultText = 'You got it all wrong!';
    }
    return resultText;
  }

  Result(this.resultscore, this.resetHandler);
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: <Widget>[
        Text(
          resultPhrase,
          style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        TextButton(onPressed: resetHandler, child: Text('Restart quiz'))
      ],
    ));
  }
}
