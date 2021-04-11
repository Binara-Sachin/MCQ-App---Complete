import 'package:mcq_app/core/models/answer_model.dart';

class Question {
  final String questionText;
  final List<Answer> answers;
  final int correctAnswer;

  Question({this.questionText, this.answers, this.correctAnswer});
}

// final List<Question> sampleQuestions = [
//   Question(
//     questionText: "A man presses more weight on earth at",
//     answers: [
//       Answer(answerText: "Sitting position"),
//       Answer(answerText: "Standing Position"),
//       Answer(answerText: "Lying Position"),
//       Answer(answerText: "None of these"),
//     ],
//     correctAnswer: 2,
//   ),
//   Question(
//     questionText:
//         "A piece of ice is dropped in a vessel containing kerosene. When ice melts, the level of kerosene will",
//     answers: [
//       Answer(answerText: "Rise"),
//       Answer(answerText: "Fall"),
//       Answer(answerText: "Remain Same"),
//       Answer(answerText: "None of these"),
//     ],
//     correctAnswer: 2,
//   ),
//   Question(
//     questionText: "Young's modulus is the property of",
//     answers: [
//       Answer(answerText: "Gas only"),
//       Answer(answerText: "Both Solid and Liquid"),
//       Answer(answerText: "Liquid only"),
//       Answer(answerText: "Solid only"),
//     ],
//     correctAnswer: 4,
//   ),
//   Question(
//     questionText:
//         "An artificial Satellite revolves round the Earth in circular orbit, which quantity remains constant?",
//     answers: [
//       Answer(answerText: "Angular Momentum"),
//       Answer(answerText: "Linear Velocity"),
//       Answer(answerText: "Angular Displacement"),
//       Answer(answerText: "None of these"),
//     ],
//     correctAnswer: 1,
//   ),
//   Question(
//     questionText:
//         "	If electrical conductivity increases with the increase of temperature of a substance, then it is a:",
//     answers: [
//       Answer(answerText: "Conductor"),
//       Answer(answerText: "Semiconductor"),
//       Answer(answerText: "Insulator"),
//       Answer(answerText: "Carborator"),
//     ],
//     correctAnswer: 2,
//   ),
// ];
