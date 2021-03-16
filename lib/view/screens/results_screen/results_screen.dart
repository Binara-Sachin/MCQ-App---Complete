// import 'package:flutter/material.dart';
// import 'package:mcq_app/core/models/paper_model.dart';
//
// class ResultsScreen extends StatelessWidget {
//   final List<int> selectedAnswers;
//   final Paper paper;
//
//   const ResultsScreen({Key key, this.selectedAnswers, this.paper}) : super(key: key);
//
//   int calculateMarks() {
//     int marks = 0;
//
//     for (int i = 0; i < paper.questions.length; i++) {
//       if (selectedAnswers[i] == paper.questions[i].correctAnswer) {
//         marks++;
//       }
//     }
//
//     return marks;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.brown[100],
//       appBar: AppBar(
//         backgroundColor: Colors.brown[400],
//         elevation: 0.0,
//         title: Text("Results"),
//       ),
//       body: Center(
//         child: Text("Result :" + calculateMarks().toString() + " / " + paper.questions.length.toString()),
//       ),
//     );
//   }
// }
