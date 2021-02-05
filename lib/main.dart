import 'dart:math';

import 'quizbrain.dart';

import 'package:flutter/material.dart';
import 'package:myquiz/question.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

QuizBrain quizBrain = QuizBrain();

void main() {
  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(child: QuizPage()),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Widget> scorekeeper = [];

  void checkUserPickedAns(bool userPickedAns) {
    setState(() {


      if (quizBrain.isFinished() == true) {
        Alert(
                context: context,
                title: "END OF THE GAME",
                desc: "Flutter is awesome.")
            .show();

        quizBrain.reset();

        scorekeeper = [];
      } else {
        bool correctAnswer = quizBrain.getQuestionAns();

        if (userPickedAns == correctAnswer) {
          print("user entered correcte");

          scorekeeper.add(Icon(
            Icons.check,
            color: Colors.green,
          ));
        } else {
          print("user entered  wronge");
          scorekeeper.add(Icon(
            Icons.close,
            color: Colors.red,
          ));
        }

        quizBrain.getNextQuestion();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black38,
      appBar: AppBar(
        title: Text("MyQuiz"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
                flex: 5,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                      child: Text(
                    quizBrain.getQuestionText(),
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  )),
                )),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: FlatButton(
                  onPressed: () {
                    checkUserPickedAns(true);
                  },
                  child: Text("True"),
                  color: Colors.green,
                ),
              ),
            ),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: FlatButton(
                onPressed: () {
                  checkUserPickedAns(false);
                },
                child: Text("false"),
                color: Colors.red,
              ),
            )),
            Row(
              children: scorekeeper,
            ),
          ],
        ),
      ),
    );
  }
}
