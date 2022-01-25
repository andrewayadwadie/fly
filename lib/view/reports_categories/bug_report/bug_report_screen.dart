import 'dart:developer';

import 'package:awesome_dropdown/awesome_dropdown.dart';
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

  static int noticeClassifyId = 1;

  final _formKey = GlobalKey<FormState>();
  String? phone;
  String? text;
  String? name;
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
                  reverse: true,
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        const HeaderWidget(arrow: true),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 20,
                        ),
                        //type
                        AwesomeDropDown(
                          dropDownListTextStyle: const TextStyle(
                              color: lightPrimaryColor, fontSize: 16),
                          isPanDown: true,
                          padding: 5,
                          isBackPressedOrTouchedOutSide: true,
                          dropDownList: const [
                            "الإبلاغ عن منطقة حشرات",
                            "الإبلاغ عن منطقة حيوانات ضالة ",
                            "الإبلاغ عن منطقة تسريب أو تجمع مياه"
                          ],
                          dropDownIcon: const Icon(
                            Icons.arrow_drop_down,
                            color: Colors.grey,
                            size: 30,
                          ),
                          selectedItem: 'إختار نوع البلاغ ',
                          onDropDownItemClick: (selectedItem) {},
                          dropStateChanged: (isOpened) {},
                        ),
                        // name
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 20),
                          child: TextFormField(
                            keyboardType: TextInputType.phone,
                            decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      width: 3, color: primaryColor),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                labelText: "الإسم ",
                                hintText: "الإسم : ",
                                labelStyle: const TextStyle(
                                    color: blackColor,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold)
                                //enabledBorder: InputBorder.none
                                ),
                            // The validator receives the text that the user has entered.
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'برجاء إدخال الاسم ثلاثي ';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              name = value;
                            },
                          ),
                        ),

                        //phone number
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 20),
                          child: TextFormField(
                            maxLength: 11,
                            keyboardType: TextInputType.phone,
                            decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      width: 3, color: primaryColor),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                labelText: "رقم الهاتف",
                                hintText: "رقم الهاتف : ",
                                labelStyle: const TextStyle(
                                    color: blackColor,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold)

                                //enabledBorder: InputBorder.none
                                ),
                            // The validator receives the text that the user has entered.
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'برجاء إدخال رقم الهاتف ';
                              } else if (value.length < 11) {
                                return 'برجاء إدخال 11 رقم ';
                              } else if (!value.isPhoneNumber) {
                                return 'برجاء إدخال رفم هاتف صحيح ';
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
                              horizontal: 30, vertical: 15),
                          child: TextFormField(
                            keyboardType: TextInputType.text,
                            maxLines: 6,
                            decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      width: 3, color: primaryColor),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                labelText: "وصف البلاغ",
                                hintText: "وصف البلاغ : ",
                                labelStyle: const TextStyle(
                                    color: blackColor,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold)
                                //enabledBorder: InputBorder.none
                                ),
                            // The validator receives the text that the user has entered.
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'برجاء إدخال وصف للبلاغ ';
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            GetBuilder<BugLocationController>(
                              init: BugLocationController(),
                              builder: (bugController) => bugController
                                              .locationLat ==
                                          0.0 &&
                                      bugController.locationLng == 0.0
                                  ? Container(
                                      alignment: Alignment.center,
                                      width:
                                          MediaQuery.of(context).size.width / 3,
                                      height:
                                          MediaQuery.of(context).size.height /
                                              10,
                                      decoration: BoxDecoration(
                                        color: bugController.locationLat ==
                                                    0.0 &&
                                                bugController.locationLng == 0.0
                                            ? redColor
                                            : lightPrimaryColor,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Column(
                                        children: [
                                          Image.asset(
                                            'assets/icons/question-mark.png',
                                            width: 45,
                                            height: 45,
                                          ),
                                          const Text(
                                            'برجاء إرفاق مكان البلاغ ',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 12,
                                                fontFamily: 'hanimation',
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ],
                                      ))
                                  : Container(
                                      width: MediaQuery.of(context).size.width /
                                          4.5,
                                      height:
                                          MediaQuery.of(context).size.height /
                                              10,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              width: 1, color: redColor),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          image: const DecorationImage(
                                              image: AssetImage(
                                                  "assets/images/map2.jpg"))),
                                    ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height / 80,
                            ),
                            // report Images
                            imagecontroller.image != null
                                ? Container(
                                    width:
                                        MediaQuery.of(context).size.width / 3,
                                    height:
                                        MediaQuery.of(context).size.height / 10,
                                    padding: const EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 2, color: lightPrimaryColor),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Image.file(
                                      imagecontroller.image!,
                                      width: 120,
                                      height: 100,
                                      fit: BoxFit.contain,
                                    ),
                                  )
                                : Container(
                                    alignment: Alignment.center,
                                    width:
                                        MediaQuery.of(context).size.width / 3,
                                    height:
                                        MediaQuery.of(context).size.height / 10,
                                    decoration: BoxDecoration(
                                      color: redColor,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Column(
                                      children: [
                                        Image.asset(
                                          'assets/icons/question-mark.png',
                                          width: 45,
                                          height: 45,
                                        ),
                                        const Text(
                                          'برجاء إرفاق صورة للبلاغ',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12,
                                              fontFamily: 'hanimation',
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ],
                                    ),
                                  ),
                          ],
                        ),

                        SizedBox(
                          height: MediaQuery.of(context).size.height / 20,
                        ),

                        // Send Report button
                        GetBuilder<BugLocationController>(
                            builder: (bugControl) {
                          return InkWell(
                            onTap: () async {
                              // Validate returns true if the form is valid, or false otherwise.
                              if (_formKey.currentState!.validate()) {
                                _formKey.currentState!.save();

                                await ReportServices()
                                    .sendFormData(
                                        noticeClassifyId: "$noticeClassifyId",
                                        text: text,
                                        phone: phone,
                                        imge: imagecontroller.image!,
                                        lat: " ${bugControl.locationLat}",
                                        long: "${bugControl.locationLng}")
                                    .then((value) => log("result is $value"));
                              }
                            },
                            child: Container(
                              alignment: Alignment.center,
                              height: MediaQuery.of(context).size.height / 17,
                              width: MediaQuery.of(context).size.width / 2,
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
                                "إرسال بلاغ ",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          );
                        }),
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