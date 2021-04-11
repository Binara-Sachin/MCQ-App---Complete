import 'package:flutter/material.dart';
import 'package:mcq_app/core/provider/paper_provider.dart';
import 'package:provider/provider.dart';

class QuestionsPage extends StatefulWidget {
  @override
  _QuestionsPageState createState() => _QuestionsPageState();
}

class _QuestionsPageState extends State<QuestionsPage> {
  String _printDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "$twoDigitMinutes:$twoDigitSeconds";
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<PaperProvider>(
      builder: (context, paperProvider, child) {
        return Container(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "Time Elapsed : ${_printDuration(Duration(milliseconds: paperProvider.timerValue))}",
                    style: TextStyle(fontSize: 15.0),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "Time Left : ${_printDuration(paperProvider.paper.duration - Duration(milliseconds: paperProvider.timerValue))}",
                    style: TextStyle(fontSize: 15.0),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  "Question : ${paperProvider.questionIndex + 1}",
                  style: TextStyle(fontSize: 16.0),
                ),
                SizedBox(
                  height: 5.0,
                ),
                Text(
                  paperProvider.questionList[paperProvider.questionIndex].questionText,
                  style: TextStyle(fontSize: 18.0),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Expanded(
                  child: ListView.builder(
                      itemCount: paperProvider.questionList[paperProvider.questionIndex].answers.length,
                      itemBuilder: (context, index) {
                        return RadioListTile(
                          value: index + 1,
                          groupValue: paperProvider.selectedAnswers[paperProvider.questionIndex],
                          onChanged: (ind) =>
                              setState(() => paperProvider.selectedAnswers[paperProvider.questionIndex] = ind),
                          title:
                              Text(paperProvider.questionList[paperProvider.questionIndex].answers[index].answerText),
                        );
                      }),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      //color: Colors.pink[400],
                      onPressed: paperProvider.questionIndex > 0
                          ? () {
                              setState(() {
                                paperProvider.questionIndex--;
                              });
                            }
                          : null,
                      child: Text("Previous"),
                    ),
                    ElevatedButton(
                      //color: Colors.pink[400],
                      onPressed: () {
                        if (paperProvider.questionIndex < paperProvider.questionList.length - 1) {
                          setState(() {
                            paperProvider.questionIndex++;
                          });
                        } else {
                          print("Finish");
                          print(paperProvider.selectedAnswers);
                          paperProvider.stopTimer();
                          paperProvider.saveStatistics();
                          paperProvider.goToPage(2);
                        }
                      },
                      child: paperProvider.questionIndex < paperProvider.questionList.length - 1
                          ? Text("Next")
                          : Text("Finish"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
