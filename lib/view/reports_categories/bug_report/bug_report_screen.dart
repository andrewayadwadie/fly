import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fly/core/controller/internet_connectivity_controller.dart';
import 'package:fly/core/controller/location_controller.dart';
import 'package:fly/core/controller/report_type_controller.dart';
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

  String typeText = "إختر نوع البلاغ";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<ImagePickerController>(
          init: ImagePickerController(),
          builder: (imagecontroller) {
            return GetBuilder<InternetController>(
                init: InternetController(),
                builder: (internet) {
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
                            internet.checkInternet().then((value) {
                              if (value == true) {
                                Get.to(() => const TestMapScreen());
                              }
                            });
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

                              // name
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 30, vertical: 20),
                                child: TextFormField(
                                  keyboardType: TextInputType.text,
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            width: 2, color: Colors.grey),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            width: 2, color: primaryColor),
                                        borderRadius: BorderRadius.circular(10),
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
                                      border: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            width: 2, color: Colors.grey),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            width: 2, color: primaryColor),
                                        borderRadius: BorderRadius.circular(10),
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
                              //type
                              GetBuilder<ReportTypeController>(
                                  init: ReportTypeController(),
                                  builder: (controller) {
                                    return InkWell(
                                        onTap: () {
                                          showCupertinoModalPopup(
                                              context: context,
                                              builder: (ctx) {
                                                return CupertinoActionSheet(
                                                  cancelButton:
                                                      CupertinoActionSheetAction(
                                                          onPressed: () {
                                                            Navigator.pop(ctx);
                                                          },
                                                          child: const Text(
                                                            'إلغاء',
                                                            style: TextStyle(
                                                                color:
                                                                    Colors.red),
                                                          )),
                                                  actions: [
                                                    CupertinoActionSheetAction(
                                                        isDefaultAction: true,
                                                        onPressed: () =>
                                                            controller
                                                                .onTapSelected(
                                                                    ctx, 1),
                                                        child: const Text(
                                                          "الإبلاغ عن منطقة حشرات",
                                                          style: TextStyle(
                                                              color:
                                                                  primaryColor,
                                                              fontSize: 13),
                                                        )),
                                                    CupertinoActionSheetAction(
                                                        isDefaultAction: true,
                                                        onPressed: () =>
                                                            controller
                                                                .onTapSelected(
                                                                    ctx, 2),
                                                        child: const Text(
                                                          "الإبلاغ عن منطقة حيوانات ضالة او ضارية",
                                                          style: TextStyle(
                                                              color:
                                                                  primaryColor,
                                                              fontSize: 13),
                                                        )),
                                                    CupertinoActionSheetAction(
                                                        isDefaultAction: true,
                                                        onPressed: () =>
                                                            controller
                                                                .onTapSelected(
                                                                    ctx, 3),
                                                        child: const Text(
                                                          "الإبلاغ عن منطقة تسريب أو تجمع مياه",
                                                          style: TextStyle(
                                                              color:
                                                                  primaryColor,
                                                              fontSize: 13),
                                                        )),
                                                  ],
                                                );
                                              });
                                        },
                                        child: Container(
                                          padding: EdgeInsets.only(right: 7),
                                          margin: const EdgeInsets.symmetric(
                                              horizontal: 30),
                                          alignment: Alignment.centerRight,
                                          // width:
                                          //     MediaQuery.of(context).size.width / 2,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              16,
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                                width: 1, color: Colors.grey),
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Text(
                                                controller.typeText,
                                                textAlign: TextAlign.center,
                                                style: const TextStyle(
                                                    height: 1.1,
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.bold,
                                                    color: blackColor),
                                              ),
                                              const Spacer(),
                                              const Icon(
                                                Icons.arrow_drop_down,
                                                color: blackColor,
                                                size: 30,
                                              ),
                                            ],
                                          ),
                                        ));
                                  }),

                              // description
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 30, vertical: 15),
                                child: TextFormField(
                                  keyboardType: TextInputType.text,
                                  maxLines: 4,
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            width: 2, color: Colors.grey),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            width: 2, color: primaryColor),
                                        borderRadius: BorderRadius.circular(10),
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
                              //Address && Image
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  //Adress ===========================
                                  GetBuilder<BugLocationController>(
                                    init: BugLocationController(),
                                    builder: (bugController) => bugController
                                                    .locationLat ==
                                                0.0 &&
                                            bugController.locationLng == 0.0
                                        ? Container(
                                            alignment: Alignment.center,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                3,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                10,
                                            decoration: BoxDecoration(
                                              color: bugController
                                                              .locationLat ==
                                                          0.0 &&
                                                      bugController
                                                              .locationLng ==
                                                          0.0
                                                  ? redColor
                                                  : lightPrimaryColor,
                                              borderRadius:
                                                  BorderRadius.circular(10),
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
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ),
                                              ],
                                            ))
                                        : Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                4.5,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height /
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
                                    height:
                                        MediaQuery.of(context).size.height / 80,
                                  ),
                                  // report Images ===================
                                  imagecontroller.image != null
                                      ? Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              3,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              10,
                                          padding: const EdgeInsets.all(5),
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  width: 2,
                                                  color: lightPrimaryColor),
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
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              3,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              10,
                                          decoration: BoxDecoration(
                                            color: redColor,
                                            borderRadius:
                                                BorderRadius.circular(10),
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
                                                    fontWeight:
                                                        FontWeight.w400),
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
                                return GetBuilder<ReportTypeController>(
                                    init: ReportTypeController(),
                                    builder: (reportTypeController) {
                                      return GetBuilder<InternetController>(
                                          init: InternetController(),
                                          builder: (internet) {
                                            return InkWell(
                                              onTap: () async {
                                                // Validate returns true if the form is valid, or false otherwise.
                                                if (_formKey.currentState!
                                                    .validate()) {
                                                  _formKey.currentState!.save();
                                                  if (reportTypeController
                                                          .noticeClassifyId !=
                                                      0) {
                                                    internet
                                                        .checkInternet()
                                                        .then((value) {
                                                      if (value == true) {
                                                        ReportServices()
                                                            .sendFormData(
                                                                noticeClassifyId:
                                                                    "$noticeClassifyId",
                                                                text: text,
                                                                phone: phone,
                                                                imge:
                                                                    imagecontroller
                                                                        .image!,
                                                                lat:
                                                                    " ${bugControl.locationLat}",
                                                                long:
                                                                    "${bugControl.locationLng}")
                                                            .then((value) => log(
                                                                "result is $value"));
                                                      }
                                                    });
                                                  } else {
                                                    Fluttertoast.showToast(
                                                        msg:
                                                            "برجاء اختيار نوع البلاغ ",
                                                        backgroundColor:
                                                            redColor,
                                                        textColor:
                                                            Colors.white);
                                                  }
                                                }
                                              },
                                              child: Container(
                                                alignment: Alignment.center,
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height /
                                                    17,
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    2,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(40),
                                                  gradient:
                                                      const LinearGradient(
                                                          colors: [
                                                            lightPrimaryColor,
                                                            primaryColor,
                                                          ],
                                                          begin:
                                                              FractionalOffset(
                                                                  0.0, 0.0),
                                                          end: FractionalOffset(
                                                              1.0, 0.0),
                                                          stops: [0.0, 1.0],
                                                          tileMode:
                                                              TileMode.clamp),
                                                ),
                                                child: const Text(
                                                  "إرسال البلاغ ",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 18),
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),
                                            );
                                          });
                                    });
                              }),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                });
          }),
    );
  }
}
