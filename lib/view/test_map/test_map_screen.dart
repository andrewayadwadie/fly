import 'package:flutter/material.dart';
import 'package:fly/view/shared_widgets/header_widget.dart';
import 'package:get/get.dart';

import '../../test_map_screen.dart';

class TestMapScreenView extends StatelessWidget {
  const TestMapScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const HeaderWidget(arrow: false),
            const SizedBox(
              height: 300,
            ),
            Center(
              child: RaisedButton(onPressed: () {
                Get.to(const TestMapScreen());
              }, child:const Text("Test Map")),
            ),
          ],
        ),
      )),
    );
  }
}
