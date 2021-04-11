import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mcq_app/core/models/answer_model.dart';
import 'package:mcq_app/core/models/paper_model.dart';
import 'package:mcq_app/core/models/question_model.dart';

class PaperProvider extends ChangeNotifier {
  int pageIndex = 0;
  int questionIndex = 0;
  Paper paper;

  List<Question> questionList = [];
  List<int> selectedAnswers = [];
  List<int> durationList = [];

  int previousAttempts = 0;
  List<int> previousCorrectAnswers = [];
  List<int> previousDurations = [];

  Timer timer;
  int timerValue = 0;

  void startTimer() {
    if (timer != null) {
      timer.cancel();
      timer = null;
    } else {
      timer = new Timer.periodic(Duration(milliseconds: 100), (timer) {
        timerValue += 100;
        durationList[questionIndex]++;
        notifyListeners();
      });
    }
  }

  void stopTimer() {
    timer.cancel();
  }

  void loadQuestions() async {
    if (paper != null) {
      final CollectionReference questionsCollection = Firestore.instance.collection(paper.collectionName);
      await questionsCollection.getDocuments().then((value) {
        getStatistics(value);
        addQuestions(value);

        for (var i in questionList) {
          selectedAnswers.add(0);
          durationList.add(0);
        }

        notifyListeners();
      });
    } else {
      print("No Paper !");
    }
  }

  void addQuestions(QuerySnapshot snapshot) {
    for (var doc in snapshot.documents)
      if (doc.documentID != "stat") {
        questionList.add(
          Question(
            questionText: doc.data['question_text'] ?? 'Error Getting Data',
            correctAnswer: doc.data['correct'] ?? 'Error Getting Data',
            answers: [
              Answer(
                answerText: doc.data['answer_1'] ?? 'Error Getting Data',
              ),
              Answer(
                answerText: doc.data['answer_2'] ?? 'Error Getting Data',
              ),
              Answer(
                answerText: doc.data['answer_3'] ?? 'Error Getting Data',
              ),
              Answer(
                answerText: doc.data['answer_4'] ?? 'Error Getting Data',
              ),
            ],
          ),
        );
      }
  }

  int checkAnswers() {
    int marks = 0;

    for (int i = 0; i < questionList.length; i++) {
      if (checkAnswer(i)) {
        marks++;
      }
      print(i);
    }

    return marks;
  }

  bool checkAnswer(int i) {
    return selectedAnswers[i] == questionList[i].correctAnswer;
  }

  String correctPercentage(int i) {
    return (previousCorrectAnswers[i] * 100 / previousAttempts).toStringAsFixed(1);
  }

  void getStatistics(QuerySnapshot snapshot) {
    for (var doc in snapshot.documents) {
      if (doc.documentID == "stat") {
        previousAttempts = doc.data['attempts'] ?? 0;
        var tempData01 = doc.data['correct'];
        previousCorrectAnswers = tempData01 != null
            ? List<int>.from(tempData01)
            : List.generate(snapshot.documents.length - 1, (index) => 0);
        var tempData02 = doc.data['time'];
        previousDurations = tempData02 != null
            ? List<int>.from(tempData02)
            : List.generate(snapshot.documents.length - 1, (index) => 0);

        print(previousAttempts);
        print(previousDurations);
        print(previousCorrectAnswers);
      }
    }
  }

  Future saveStatistics() async {
    final CollectionReference questionsCollection = Firestore.instance.collection(paper.collectionName);
    int newAttempts = previousAttempts + 1;
    List<int> newCorrectAnswers = List.generate(questionList.length, (index) => 0);
    List<int> newDurations = List.generate(questionList.length, (index) => 0);

    for (int i = 0; i < questionList.length; i++) {
      if (checkAnswer(i)) {
        newCorrectAnswers[i] = previousCorrectAnswers[i] + 1;
      } else {
        newCorrectAnswers[i] = previousCorrectAnswers[i];
      }

      newDurations[i] = (((previousDurations[i] * previousAttempts) + durationList[i]) / newAttempts).round();
    }

    return await questionsCollection.document("stat").setData({
      'attempts': newAttempts,
      'correct': newCorrectAnswers,
      'time': newDurations,
    });
  }

  void goToPage(int index) {
    pageIndex = index;
    notifyListeners();
  }

  void reset() {
    pageIndex = 0;
    questionIndex = 0;

    questionList = [];
    selectedAnswers = [];
    durationList = [];

    timerValue = 0;
  }
}
