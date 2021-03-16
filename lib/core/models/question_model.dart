import 'package:mcq_app/core/models/answer_model.dart';

class Question {
  final String text;
  final List<Answer> answers;
  final int correctAnswer;

  Question({this.text, this.answers, this.correctAnswer});
}

final List<Question> sampleQuestions = [
  Question(
    text: "A man presses more weight on earth at",
    answers: [
      Answer(text: "Sitting position"),
      Answer(text: "Standing Position"),
      Answer(text: "Lying Position"),
      Answer(text: "None of these"),
    ],
    correctAnswer: 2,
  ),
  Question(
    text: "A piece of ice is dropped in a vessel containing kerosene. When ice melts, the level of kerosene will",
    answers: [
      Answer(text: "Rise"),
      Answer(text: "Fall"),
      Answer(text: "Remain Same"),
      Answer(text: "None of these"),
    ],
    correctAnswer: 2,
  ),
  Question(
    text: "Young's modulus is the property of",
    answers: [
      Answer(text: "Gas only"),
      Answer(text: "Both Solid and Liquid"),
      Answer(text: "Liquid only"),
      Answer(text: "Solid only"),
    ],
    correctAnswer: 4,
  ),
  Question(
    text: "An artificial Satellite revolves round the Earth in circular orbit, which quantity remains constant?",
    answers: [
      Answer(text: "Angular Momentum"),
      Answer(text: "Linear Velocity"),
      Answer(text: "Angular Displacement"),
      Answer(text: "None of these"),
    ],
    correctAnswer: 1,
  ),
  Question(
    text: "	If electrical conductivity increases with the increase of temperature of a substance, then it is a:",
    answers: [
      Answer(text: "Conductor"),
      Answer(text: "Semiconductor"),
      Answer(text: "Insulator"),
      Answer(text: "Carborator"),
    ],
    correctAnswer: 2,
  ),
];
