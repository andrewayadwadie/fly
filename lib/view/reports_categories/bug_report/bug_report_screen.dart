import 'package:flutter/material.dart';
import 'package:fly/view/shared_widgets/header_widget.dart';

class BugReportScreen extends StatelessWidget {
  const BugReportScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children:const [
            HeaderWidget(arrow: true),
            
          ],
        ),
    )),
    );
  }
}