import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fly/core/controller/location_controller.dart';
import 'package:fly/core/service/report_service.dart';

import 'package:get/get.dart';

import 'package:hawk_fab_menu/hawk_fab_menu.dart';

import 'package:fly/core/controller/image_picker_controller.dart';
import 'package:fly/test_map_screen.dart';
import 'package:fly/utils/style.dart';
import 'package:fly/view/shared_widgets/header_widget.dart';


// ignore: must_be_immutable
class BugReportScreen extends StatelessWidget {
  BugReportScreen({
    Key? key,
  }) : super(key: key);


 static  int noticeClassifyId =1;


  final _formKey = GlobalKey<FormState>();
  String? phone;
  String? text;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<ImagePickerController>(
          init: ImagePickerController(),
          builder: (imagecontroller) {
            return HawkFabMenu(
              openIcon: Icons.add,
              blur: 0.5,
              fabColor: Colors.yellow,
              iconColor: primaryColor,
              closeIcon: Icons.close,
              items: [
                HawkFabMenuItem(
                    label: 'add location'.tr,
                    ontap: () {
                      Get.to(() => const TestMapScreen());
                    },
                    icon: const Icon(Icons.maps_ugc),
                    color: primaryColor,
                    labelColor: lightPrimaryColor,
                    labelBackgroundColor: Colors.white),
                HawkFabMenuItem(
                    label: 'add picture'.tr,
                    ontap: () {
                      imagecontroller.pickImageFromGallrey();
                    },
                    icon: const Icon(Icons.image),
                    color: primaryColor,
                    labelColor: lightPrimaryColor,
                    labelBackgroundColor: Colors.white),
                HawkFabMenuItem(
                    label: 'take picture'.tr,
                    ontap: () {
                      imagecontroller.pickImageFromCam();
                    },
                    icon: const Icon(Icons.add_a_photo),
                    color: primaryColor,
                    labelColor: lightPrimaryColor,
                    labelBackgroundColor: Colors.white),
              ],
              body: SafeArea(
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        const HeaderWidget(arrow: true),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 20,
                        ),
                        //phone number
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 20),
                          child: TextFormField(
                            keyboardType: TextInputType.phone,
                            decoration: const InputDecoration(
                              hintText: "رقم الهاتف ",

                              //enabledBorder: InputBorder.none
                            ),
                            // The validator receives the text that the user has entered.
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your phone';
                              } else if (value.length < 11) {
                                return 'Please enter 11 number ';
                              } else if (!value.isPhoneNumber) {
                                return 'Please enter correct phone number';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              phone = value;
                            },
                          ),
                        ),
                        // description
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 15),
                          child: TextFormField(
                            keyboardType: TextInputType.text,
                            maxLines: 6,
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    width: 3, color: primaryColor),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    width: 3, color: primaryColor),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              hintText: "وصف البلاغ ",
                              //enabledBorder: InputBorder.none
                            ),
                            // The validator receives the text that the user has entered.
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter Report Description';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              text = value;
                            },
                          ),
                        ),

                        SizedBox(
                          height: MediaQuery.of(context).size.height / 80,
                        ),
                        //Address
                        GetBuilder<BugLocationController>(
                          init: BugLocationController(),
                          builder: (bugController) => Container(
                            alignment: Alignment.center,
                            width: 250,
                            height: 60,
                            decoration: BoxDecoration(
                              color: bugController.locationLat == 0.0 &&
                                    bugController.locationLng == 0.0 ? redColor : lightPrimaryColor,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: bugController.locationLat == 0.0 &&
                                    bugController.locationLng == 0.0
                                ? const Text(
                                    'برجاء إرفاق مكان البلاغ ',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                        fontFamily: 'hanimation',
                                        fontWeight: FontWeight.w400),
                                  )
                                : Column(
                                    children: [
                                      Text("${bugController.locationLat}",style:const TextStyle(color: Colors.white),),
                                      Text("${bugController.locationLng}",style:const TextStyle(color: Colors.white),),
                                    ],
                                  ),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 80,
                        ),
                        // report Images
                        imagecontroller.image != null
                            ? Container(
                                width: MediaQuery.of(context).size.width/1.3,
                                height: MediaQuery.of(context).size.height/5,
                                padding: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 2, color: lightPrimaryColor),
                                        borderRadius: BorderRadius.circular(10)
                                        ),
                                child: Image.file(
                                  imagecontroller.image!,
                                  width: 120,
                                  height: 100,
                                  fit: BoxFit.contain,
                                ),
                              )
                            : Container(
                                alignment: Alignment.center,
                                width: 120,
                                height: 60,
                                decoration: BoxDecoration(
                                  color: redColor,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: const Text(
                                  'برجاء إرفاق صورة للبلاغ',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontFamily: 'hanimation',
                                      fontWeight: FontWeight.w400),
                                ),
                              ),

                        SizedBox(
                          height: MediaQuery.of(context).size.height / 40,
                        ),
                        // Send Report button
                         GetBuilder<BugLocationController>(
                          builder: (bugControl) {
                            return InkWell(
                              onTap: () async{
                                // Validate returns true if the form is valid, or false otherwise.
                                if (_formKey.currentState!.validate()) {
                                  _formKey.currentState!.save();
                              
                                await ReportServices().sendFormData(
                                  noticeClassifyId: "$noticeClassifyId",
                                  text: text,
                                   phone: phone,
                                    imge: imagecontroller.image!, 
                                    lat: " ${bugControl.locationLat}",
                                     long: "${bugControl.locationLng}").then(
                                       (value) => log("result is $value"));

                                }
                              },
                              child: Container(
                                alignment: Alignment.center,
                                height: 50,
                                width: 100,
                                decoration: BoxDecoration(
                                    color: primaryColor,
                                    borderRadius: BorderRadius.circular(5)),
                                child: const Text(
                                  "send",
                                  style: TextStyle(color: Colors.white),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            );
                          }
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}



/*

Form(
        key: _formKey,
        child: Column(
          children: [
            //------------------ start first fields-------------------------//
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.only(bottom: 15),
              padding: const EdgeInsets.symmetric(horizontal: 12),
              width: MediaQuery.of(context).size.width / 1.1,
              height: MediaQuery.of(context).size.height / 15,
              decoration: BoxDecoration(
                  color: greyColor,
                  borderRadius: BorderRadiusDirectional.circular(30)),
              child: TextFormField(
                onSaved: (value) {
                  userName = value;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return ' برجاء إدخال الحقل المطلوب';
                  } else {
                    return null;
                  }
                },
                keyboardType: TextInputType.name,
                cursorColor: lightPrimaryColor,
                textAlignVertical: TextAlignVertical.center,
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.only(bottom: 15),
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  labelText: 'حقل إدخال ',
                  border: InputBorder.none,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 15),
              padding: const EdgeInsets.symmetric(horizontal: 12),
              width: MediaQuery.of(context).size.width / 1.1,
              height: MediaQuery.of(context).size.height / 15,
              decoration: BoxDecoration(
                  color: greyColor,
                  borderRadius: BorderRadiusDirectional.circular(30)),
              child: TextFormField(
                onSaved: (value) {
                  userName = value;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return ' برجاء إدخال الحقل المطلوب';
                  } else {
                    return null;
                  }
                },
                keyboardType: TextInputType.name,
                cursorColor: lightPrimaryColor,
                textAlignVertical: TextAlignVertical.center,
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.only(bottom: 15),
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  labelText: 'حقل إدخال ',
                  border: InputBorder.none,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 15),
              padding: const EdgeInsets.symmetric(horizontal: 12),
              width: MediaQuery.of(context).size.width / 1.1,
              height: MediaQuery.of(context).size.height / 15,
              decoration: BoxDecoration(
                  color: greyColor,
                  borderRadius: BorderRadiusDirectional.circular(30)),
              child: TextFormField(
                onSaved: (value) {
                  userName = value;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return ' برجاء إدخال الحقل المطلوب';
                  } else {
                    return null;
                  }
                },
                keyboardType: TextInputType.name,
                cursorColor: lightPrimaryColor,
                textAlignVertical: TextAlignVertical.center,
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.only(bottom: 15),
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  labelText: 'حقل إدخال ',
                  border: InputBorder.none,
                ),
              ),
            ),

            //------------------ end first fields-------------------------//

            Container(
              margin: const EdgeInsets.only(bottom: 5),
              padding: const EdgeInsets.symmetric(horizontal: 12),
              width: MediaQuery.of(context).size.width / 1.2,
              height: MediaQuery.of(context).size.height / 5,
              decoration: BoxDecoration(
                  color: greyColor,
                  borderRadius: BorderRadiusDirectional.circular(5)),
              child: TextFormField(
                onSaved: (value) {
                  userName = value;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return ' برجاء إدخال الحقل المطلوب';
                  } else {
                    return null;
                  }
                },
                keyboardType: TextInputType.name,
                cursorColor: lightPrimaryColor,
                textAlignVertical: TextAlignVertical.center,
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.only(bottom: 5),
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  labelText: 'حقل إدخال ',
                  border: InputBorder.none,
                ),
              ),
            ),

            ///button
            SizedBox(
              height: MediaQuery.of(context).size.height / 35,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                    }
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width / 2,
                    height: MediaQuery.of(context).size.height / 15,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: primaryColor,
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      'enter'.tr,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Image.asset(
                    "assets/images/map3.png",
                    fit: BoxFit.contain,
                    width: 70,
                    height: 60,
                  ),
                ),
              ],
            )
          ],
        ),
      ),


 */