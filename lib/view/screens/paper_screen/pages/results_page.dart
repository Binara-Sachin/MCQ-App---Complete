import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:mcq_app/core/provider/paper_provider.dart';
import 'package:mcq_app/view/screens/home_screen/home_screen.dart';
import 'package:provider/provider.dart';

class ResultsPage extends StatefulWidget {
  @override
  _ResultsPageState createState() => _ResultsPageState();
}

class _ResultsPageState extends State<ResultsPage> {
  int marks;

  @override
  void initState() {
    marks = Provider.of<PaperProvider>(context, listen: false).checkAnswers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<PaperProvider>(
      builder: (context, paperProvider, child) {
        return Container(
          width: double.infinity,
          child: SingleChildScrollView(
            padding: EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    "Marks: ${marks.toString()} / ${paperProvider.questionList.length}",
                    style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                ExpansionTile(
                  title: Text('Check Answers'),
                  childrenPadding: EdgeInsets.all(8.0),
                  children: List<Widget>.generate(
                    paperProvider.questionList.length,
                    (i) => ExpansionTile(
                      title: Text('Question  ${i + 1}'),
                      subtitle: Text('${paperProvider.correctPercentage(i)}% got this correct'),
                      trailing: paperProvider.checkAnswer(i)
                          ? Icon(
                              Icons.check_circle,
                              color: Colors.green,
                            )
                          : Icon(
                              Icons.dangerous,
                              color: Colors.red,
                            ),
                      childrenPadding: EdgeInsets.all(10.0),
                      expandedCrossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(paperProvider.questionList[i].questionText),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(
                              'Selected Answer : ${paperProvider.questionList[i].answers[paperProvider.selectedAnswers[i] - 1].answerText}',
                              style: TextStyle(color: paperProvider.checkAnswer(i) ? Colors.green : Colors.red)),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(
                            'Correct Answer : ${paperProvider.questionList[i].answers[paperProvider.questionList[i].correctAnswer - 1].answerText}',
                            style: TextStyle(color: Colors.green),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // SizedBox(
                //   height: 20,
                // ),
                ExpansionTile(
                  title: Text("Time Analysis"),
                  childrenPadding: EdgeInsets.all(10.0),
                  expandedCrossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 200,
                      //width: 300,
                      child: BarChart(
                        BarChartData(
                          alignment: BarChartAlignment.spaceEvenly,
                          axisTitleData: FlAxisTitleData(
                            show: true,
                            leftTitle: AxisTitle(
                              showTitle: true,
                              titleText: "Time (s)",
                            ),
                            bottomTitle: AxisTitle(
                              showTitle: true,
                              titleText: "Question No",
                            ),
                          ),
                          borderData: FlBorderData(
                            border: Border(
                              top: BorderSide.none,
                              right: BorderSide.none,
                              left: BorderSide(width: 1),
                              bottom: BorderSide(width: 1),
                            ),
                          ),
                          gridData: FlGridData(
                            drawHorizontalLine: true,
                            horizontalInterval: 0.25,
                          ),
                          groupsSpace: 10,
                          barGroups: List<BarChartGroupData>.generate(
                            paperProvider.questionList.length,
                            (i) => BarChartGroupData(x: i + 1, barRods: [
                              BarChartRodData(
                                  y: (paperProvider.durationList[i] / 1000.0).toDouble(),
                                  width: 5,
                                  colors: [Colors.amber]),
                              BarChartRodData(
                                  y: (paperProvider.previousDurations[i] / 1000.0).toDouble(),
                                  width: 5,
                                  colors: [Colors.red]),
                            ]),
                          ),
                        ),
                        //swapAnimationDuration: Duration(milliseconds: 150),
                        //swapAnimationCurve: Curves.linear,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0, left: 50.0),
                      child: Row(
                        children: [
                          Container(
                            width: 100,
                            child: Text("Your Time"),
                          ),
                          Container(
                            height: 5.0,
                            width: 30.0,
                            color: Colors.amber,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0, left: 50.0),
                      child: Row(
                        children: [
                          Container(
                            width: 100,
                            child: Text("Average Time"),
                          ),
                          Container(
                            height: 5.0,
                            width: 30.0,
                            color: Colors.red,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Center(
                    child: Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomeScreen(),
                          ),
                        );
                      },
                      child: Text("Home")),
                ))
              ],
            ),
          ),
        );
      },
    );
  }
}
