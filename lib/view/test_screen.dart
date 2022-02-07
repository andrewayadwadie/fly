import 'dart:developer';
 
import 'package:flutter/material.dart';
 import 'package:fly/core/controller/image_picker_controller.dart';
import 'package:fly/utils/style.dart';
import 'package:fly/view/shared_widgets/header_widget.dart';
import 'package:get/get.dart';
 

class TestScreen extends StatelessWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
      child: GetBuilder<ImagePickerController>(
          init: ImagePickerController(),
          builder: (imgCtrl) {
            return Column(children: [
              const HeaderWidget(arrow: true),
              SizedBox(
                height: MediaQuery.of(context).size.height / 5,
              ),
              InkWell(
                onTap: () async {
                  log("message");
                  imgCtrl.loadAssets();
                },
                child: Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width / 2.5,
                  height: MediaQuery.of(context).size.height / 17,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    gradient: const LinearGradient(
                        colors: [
                          lightPrimaryColor,
                          primaryColor,
                        ],
                        begin: FractionalOffset(0.0, 0.0),
                        end: FractionalOffset(1.0, 0.0),
                        stops: [0.0, 1.0],
                        tileMode: TileMode.clamp),
                  ),
                  child: const Text(
                    'show Images',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: Colors.white),
                  ),
                ),
              ),
              SizedBox(
                width: 300,
                height: 600,
                child: GridView.builder(
                  itemCount: imgCtrl.images.length,
                  itemBuilder: (context, index) {
                    return Container(
                      width: 120,
                      height: 50,
                      decoration: const BoxDecoration(
                        color: lightPrimaryColor,
                        // image: DecorationImage(image: AssetImage(imgCtrl.images[index].))
                      ),
                      child: const Text("dsd"),
                    );
                  },
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 5,
                    crossAxisSpacing: 5.0,
                    mainAxisSpacing: 5.0,
                  ),
                ),
              ),
            ]);
          }),
    )));
  }
}
