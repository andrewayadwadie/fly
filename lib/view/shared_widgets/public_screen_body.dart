import 'package:flutter/material.dart';
import 'package:fly/utils/style.dart';
import 'package:fly/view/shared_widgets/line_dot.dart';
import 'package:get/get.dart';
import 'header_widget.dart';

class PublicScreenBody extends StatelessWidget {
  const PublicScreenBody(
      {Key? key, required this.singleScreen, required this.title})
      : super(key: key);
  final Widget singleScreen;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
        
        //  reverse: true,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            
            children: [
              const HeaderWidget(arrow: true,),
              SizedBox(
                height: MediaQuery.of(context).size.height / 30,
              ),
              Text(
                title.tr,
                style: const TextStyle(fontSize: 25, fontFamily: 'hanimation',color: primaryColor),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 90,
              ),
              const LineDots(),
              SizedBox(height: MediaQuery.of(context).size.height/50,),
              SizedBox(
                  width: MediaQuery.of(context).size.width / 1.1,
                  height: MediaQuery.of(context).size.height / 1.4,
                  //  color: secondaryColor,
                  child: ListView(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  children:[
                       singleScreen
                  ]
                  )),
              // const Footer()
            ],
          ),
        ),
      ),
    );
  }
}
