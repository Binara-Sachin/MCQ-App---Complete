import 'package:flutter/material.dart';
import 'package:mcq_app/core/models/paper_model.dart';
import 'package:provider/provider.dart';

import 'file:///D:/Projects/MCQ%20App/mcq_app/lib/view/screens/home_screen/widgets/paper_tile.dart';

class PaperList extends StatefulWidget {
  @override
  _PaperListState createState() => _PaperListState();
}

class _PaperListState extends State<PaperList> {
  @override
  Widget build(BuildContext context) {
    final papers = Provider.of<List<Paper>>(context);

    if (papers == null) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }

    return GridView.builder(
      padding: EdgeInsets.all(10.0),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 0.75,
      ),
      itemCount: papers.length,
      itemBuilder: (context, index) {
        return PaperTile(
          paper: papers[index],
        );
      },
    );
  }
}
