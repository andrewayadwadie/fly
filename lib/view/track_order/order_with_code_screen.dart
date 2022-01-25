import 'package:flutter/material.dart';
import 'package:fly/view/shared_widgets/header_widget.dart';

class OrderWithCodeScreen extends StatelessWidget {
  const OrderWithCodeScreen({ Key? key }) : super(key: key);

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
        ),
      ),
    );
  }
}
