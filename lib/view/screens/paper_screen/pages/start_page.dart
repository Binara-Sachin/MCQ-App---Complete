import 'package:flutter/material.dart';
import 'package:mcq_app/core/provider/paper_provider.dart';
import 'package:provider/provider.dart';

class StartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // return Center(
    //   child: Text("Start Page"),
    // );
    return Consumer<PaperProvider>(
      builder: (context, paper, child) {
        return Text("Index: ${paper.pageIndex}");
      },
    );
  }
}
