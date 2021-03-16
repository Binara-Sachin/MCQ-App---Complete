import 'package:flutter/material.dart';
import 'package:mcq_app/core/models/paper_model.dart';
import 'package:mcq_app/view/screens/home_screen/paper_tile.dart';
import 'package:provider/provider.dart';

class PaperList extends StatefulWidget {
  @override
  _PaperListState createState() => _PaperListState();
}

class _PaperListState extends State<PaperList> {
  @override
  Widget build(BuildContext context) {
    final papers = Provider.of<List<Paper>>(context);
    //print("Paper Collection " + papers.length.toString());

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
