import 'package:flutter/material.dart';

class QuestionsPage extends StatefulWidget {
  @override
  _QuestionsPageState createState() => _QuestionsPageState();
}

class _QuestionsPageState extends State<QuestionsPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Text(
            //   widget.paper.questions[_questionIndex].text,
            //   style: TextStyle(fontSize: 16.0),
            // ),
            // Expanded(
            //   child: ListView.builder(
            //       itemCount: widget.paper.questions[_questionIndex].answers.length,
            //       itemBuilder: (context, index) {
            //         return RadioListTile(
            //           value: index + 1,
            //           groupValue: _selectedAnswers[_questionIndex],
            //           onChanged: (ind) => setState(() => _selectedAnswers[_questionIndex] = ind),
            //           title: Text(widget.paper.questions[_questionIndex].answers[index].text),
            //         );
            //       }),
            // ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // RaisedButton(
                //   color: Colors.pink[400],
                //   onPressed: _questionIndex > 0
                //       ? () {
                //           setState(() {
                //             _questionIndex--;
                //           });
                //         }
                //       : null,
                //   child: Text("Previous"),
                // ),
                // RaisedButton(
                //   color: Colors.pink[400],
                //   onPressed: () {
                //     if (_questionIndex < widget.paper.questions.length - 1) {
                //       setState(() {
                //         _questionIndex++;
                //       });
                //     } else {
                //       print("Finish");
                //       print(_selectedAnswers);
                //       Navigator.push(
                //         context,
                //         MaterialPageRoute(
                //           builder: (context) => ResultsScreen(
                //             selectedAnswers: _selectedAnswers,
                //             paper: widget.paper,
                //           ),
                //         ),
                //       );
                //     }
                //   },
                //   child: _questionIndex < widget.paper.questions.length - 1 ? Text("Next") : Text("Finish"),
                // ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
