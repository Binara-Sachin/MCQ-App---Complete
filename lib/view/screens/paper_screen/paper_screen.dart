import 'package:flutter/material.dart';
import 'package:mcq_app/core/models/paper_model.dart';
import 'package:mcq_app/core/provider/paper_provider.dart';
import 'package:mcq_app/view/screens/paper_screen/pages/questions_page.dart';
import 'package:mcq_app/view/screens/paper_screen/pages/results_page.dart';
import 'package:mcq_app/view/screens/paper_screen/pages/start_page.dart';
import 'package:provider/provider.dart';

class PaperScreen extends StatefulWidget {
  final Paper paper;

  const PaperScreen({Key key, this.paper}) : super(key: key);

  @override
  _PaperScreenState createState() => _PaperScreenState();
}

class _PaperScreenState extends State<PaperScreen> {
  List<Widget> _pages = [StartPage(), QuestionsPage(), ResultsPage()];

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PaperProvider(),
      child: Scaffold(
        backgroundColor: Colors.brown[100],
        appBar: AppBar(
          backgroundColor: Colors.brown[400],
          elevation: 0.0,
          title: Text(widget.paper.name),
        ),
        //body: _pages[Provider.of<PaperProvider>(context, listen: false).pageIndex],
        body: _pages[0],
      ),
    );
  }
}
