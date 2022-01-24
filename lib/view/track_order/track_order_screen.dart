import 'package:flutter/material.dart';
import 'package:fly/utils/style.dart';
import 'package:fly/view/shared_widgets/header_widget.dart';

class TrackOrderScreen extends StatelessWidget {
  const TrackOrderScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const HeaderWidget(arrow: false),
              SizedBox(
                height: MediaQuery.of(context).size.height / 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  decoration:  BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          border: Border.all(width:2,color: lightPrimaryColor)
                        ),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 2.4,
               
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 20,
              ),

            ],
          ),
        ),
      ),
    );
  }
}