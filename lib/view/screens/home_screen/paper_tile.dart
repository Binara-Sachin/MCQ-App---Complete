import 'package:flutter/material.dart';
import 'package:mcq_app/core/models/paper_model.dart';
import 'package:mcq_app/view/screens/paper_screen/paper_screen.dart';

class PaperTile extends StatelessWidget {
  final Paper paper;

  const PaperTile({Key key, this.paper}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      semanticContainer: true,
      color: Colors.white,
      child: InkWell(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(paper.name),
            Text(paper.subject),
            //Text("Questions - " + paper.noOfQuestions.toString()),
            Text("Time - " + paper.duration.inMinutes.toString() + " min"),
          ],
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PaperScreen(
                paper: paper,
              ),
            ),
          );
        },
      ),
    );
  }
}
