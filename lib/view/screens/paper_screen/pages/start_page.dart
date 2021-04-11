import 'package:flutter/material.dart';
import 'package:mcq_app/core/provider/paper_provider.dart';
import 'package:provider/provider.dart';

class StartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<PaperProvider>(
      builder: (context, paperProvider, child) {
        return Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0, 10.0),
                    child: Text(
                      "Paper: ${paperProvider.paper.name}",
                      style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: 120,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Subject:",
                              style: TextStyle(fontSize: 18.0),
                            ),
                            Text(
                              "Questions:",
                              style: TextStyle(fontSize: 18.0),
                            ),
                            Text(
                              "Time:",
                              style: TextStyle(fontSize: 18.0),
                            ),
                          ],
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${paperProvider.paper.subject}",
                            style: TextStyle(fontSize: 18.0),
                          ),
                          Text(
                            "${paperProvider.questionList == null ? 0 : paperProvider.questionList.length}",
                            style: TextStyle(fontSize: 18.0),
                          ),
                          Text(
                            "${paperProvider.paper.duration.inMinutes} min",
                            style: TextStyle(fontSize: 18.0),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  if (paperProvider.questionList != null) {
                    paperProvider.goToPage(1);
                    paperProvider.startTimer();
                  }
                },
                child: Text("Start Paper"),
              ),
            ),
          ],
        );
      },
    );
  }
}
