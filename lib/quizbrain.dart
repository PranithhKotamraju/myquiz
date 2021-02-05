import 'question.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class QuizBrain {
  int _questionNumber = 0;

  List<Question> _questionBank = [

    Question(questionText:'A song that need to be played loud' , questionAnswer: true),
    Question(questionText:'A song that need to be played smooth' , questionAnswer: false),
    Question(questionText:'A song that need to be played hard' , questionAnswer: true),
    Question(questionText:'A song that need to be played yi' , questionAnswer: false),
    Question(questionText:'A song that need to be played kitt' , questionAnswer: true),
    Question(questionText:'A song that need to be played tee' , questionAnswer: true),
    Question(questionText:'A song that need to be played wen' , questionAnswer: true),






  ];

  void getNextQuestion() {
    if (_questionNumber < _questionBank.length - 1) {
      _questionNumber++;

      print(_questionNumber);
      print(_questionBank.length);
    }
  }

  String getQuestionText() {
    return _questionBank[_questionNumber].questionText;
  }

  bool getQuestionAns() {
    return _questionBank[_questionNumber].questionAnswer;
  }

  bool isFinished() {
    if (_questionNumber >= _questionBank.length - 1) {
      print("true");

      return true;
    } else {
      return false;
    }
  }

  void reset() {
    _questionNumber = 0;
  }
}
