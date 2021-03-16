import 'package:flutter/material.dart';
import 'package:mcq_app/core/models/question_model.dart';

class PaperProvider extends ChangeNotifier {
  int pageIndex = 0;

  List<Question> questionList;
  List<int> selectedAnswers;
  List<int> durationList;

  void removeAll() {
    //code
    notifyListeners();
  }
}
