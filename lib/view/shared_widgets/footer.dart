import 'package:flutter/material.dart';
import 'package:fly/utils/style.dart';

class Footer extends StatelessWidget {
  const Footer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      width: double.infinity,
      height: MediaQuery.of(context).size.height / 16.4,
      color: secondaryColor,
    );
  }
}
