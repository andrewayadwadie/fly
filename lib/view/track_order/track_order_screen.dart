import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fly/utils/style.dart';
import 'package:fly/view/shared_widgets/header_widget.dart';
import 'package:fly/view/track_order/otp_screen.dart';

import 'order_with_code_screen.dart';

// ignore: must_be_immutable
class TrackOrderScreen extends StatelessWidget {
  TrackOrderScreen({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  var phoneController = TextEditingController();
  var codeController = TextEditingController();
  int phone = 0;
  String code = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const HeaderWidget(arrow: true),
              SizedBox(
                height: MediaQuery.of(context).size.height / 7,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                          color: Colors.black.withOpacity(0.6),
                          blurRadius: 6,
                          offset: const Offset(3, 5),
                        ),
                      ],
                      borderRadius: BorderRadius.circular(40),
                      border: Border.all(width: 2, color: lightPrimaryColor)),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 2.4,
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 40,
                          ),
                          child: TextFormField(
                            controller: phoneController,
                            maxLength: 11,
                            keyboardType: TextInputType.phone,
                            decoration: InputDecoration(
                               border:OutlineInputBorder(
                                 borderSide: const BorderSide(
                                      width: 2, color: Colors.grey),
                                  borderRadius: BorderRadius.circular(10),
                              ) ,
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      width: 2, color: primaryColor),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                labelText: "رقم الهاتف",
                                hintText: "رقم الهاتف",
                                labelStyle: const TextStyle(
                                    color: blackColor,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold)
                                //enabledBorder: InputBorder.none
                                ),
                            onChanged: (value) {
                              phone = int.parse(value);
                            },
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 80,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 40,
                          ),
                          child: TextFormField(
                            controller: codeController,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                               border:OutlineInputBorder(
                                 borderSide: const BorderSide(
                                      width: 2, color: Colors.grey),
                                  borderRadius: BorderRadius.circular(10),
                              ) ,
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      width: 2, color: primaryColor),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                labelText: "رقم البلاغ",
                                hintText: "رقم البلاغ",
                                labelStyle: const TextStyle(
                                    color: blackColor,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold)
                                //enabledBorder: InputBorder.none

                                //enabledBorder: InputBorder.none
                                ),
                            onSaved: (value) {
                              code = value!;
                            },
                            onChanged: (val) {
                              phoneController.clear();
                            },
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 80,
                        ),
                        InkWell(
                          onTap: () async {
                            if (_formKey.currentState!.validate()) {
                              _formKey.currentState!.save();
                              phoneController.clear();
                              codeController.clear();
                              if (phone > 0 && code.isEmpty) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => OtpScreen(
                                              phoneNumber: phone,
                                            )));
                              } else if (phone == 0 && code.isNotEmpty) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            OrderWithCodeScreen(
                                              phone: phone,
                                              code: code,
                                            )));
                              } else if (phone > 0 && code.isNotEmpty) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            OrderWithCodeScreen(
                                              phone: phone,
                                              code: code,
                                            )));
                              } else if (phone == 0 && code.isEmpty) {
                                Fluttertoast.showToast(
                                    msg:
                                        "برجاء إدخال رقم الهاتف او كود البلاغ ",
                                    timeInSecForIosWeb: 3,
                                    gravity: ToastGravity.CENTER,
                                    toastLength: Toast.LENGTH_LONG,
                                    fontSize: 20,
                                    textColor: Colors.white,
                                    backgroundColor: redColor);
                              }
                            }
                          },
                          child: Container(
                            alignment: Alignment.center,
                            width: MediaQuery.of(context).size.width / 1.6,
                            height: MediaQuery.of(context).size.height / 14,
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
                              'تتبع البلاغات ',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
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



/**
 
  InkWell(
                        onTap: () async {
                          showDialog(
                              context: context,
                              builder: (ctx) {
                                return AlertDialog(
                                  title: const Center(
                                    child: Text(
                                      "برجاء إدخال رقم الهاتف ",
                                      style: TextStyle(
                                          color: primaryColor,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                  content: Form(
                                    key: _formKey,
                                    child: SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height /
                                              5,
                                      child: Column(
                                        children: [
                                          TextFormField(
                                            maxLength: 11,
                                            keyboardType: TextInputType.phone,
                                            decoration: InputDecoration(
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: const BorderSide(
                                                    width: 3,
                                                    color: primaryColor),
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: const BorderSide(
                                                    width: 3,
                                                    color: primaryColor),
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                              ),
                                              hintText: "رقم الهاتف",
                                              //enabledBorder: InputBorder.none
                                            ),
                                            validator: (value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                return 'برجاء إدخال رقم الهاتف ';
                                              } else if (value.length < 11) {
                                                return 'برجاء إدخال 11 رقم ';
                                              } else if (!value.isPhoneNumber) {
                                                return 'برجاء إدخال رقم هاتف صحيح ';
                                              }
                                              return null;
                                            },
                                            onChanged: (value) {
                                              phone = int.parse(value);
                                            },
                                          ),
                                          SizedBox(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                50,
                                          ),
                                          InkWell(
                                            onTap: () async {
                                              // Validate returns true if the form is valid, or false otherwise.
                                              if (_formKey.currentState!
                                                  .validate()) {
                                                _formKey.currentState!.save();
                                                Navigator.pop(ctx);
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            OtpScreen(
                                                              phoneNumber:
                                                                  phone,
                                                            )));
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
                                                gradient: const LinearGradient(
                                                    colors: [
                                                      lightPrimaryColor,
                                                      primaryColor,
                                                    ],
                                                    begin: FractionalOffset(
                                                        0.0, 0.0),
                                                    end: FractionalOffset(
                                                        1.0, 0.0),
                                                    stops: [0.0, 1.0],
                                                    tileMode: TileMode.clamp),
                                              ),
                                              child: const Text(
                                                "تأكيد رقم الهاتف ",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 18),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              });
                        },
                        child: Container(
                          alignment: Alignment.center,
                          width: MediaQuery.of(context).size.width / 1.6,
                          height: MediaQuery.of(context).size.height / 14,
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
                            'تتبع جميع البلاغات عن طريق رقم الهاتف ',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Colors.white),
                          ),
                        ),
                      ),


//////////////////////////////////////////////////////////////////////////////////////////////////////////////

                       InkWell(
                        onTap: () {
                            showDialog(
                              context: context,
                              builder: (ctx) {
                                return AlertDialog(
                                  title: const Center(
                                    child: Text(
                                      "برجاء إدخال رقم البلاغ ",
                                      style: TextStyle(
                                          color: primaryColor,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                  content: Form(
                                    key: _formKey,
                                    child: SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height /
                                              5,
                                      child: Column(
                                        children: [
                                          TextFormField(
                                           
                                            keyboardType: TextInputType.phone,
                                            decoration: InputDecoration(
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: const BorderSide(
                                                    width: 3,
                                                    color: primaryColor),
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: const BorderSide(
                                                    width: 3,
                                                    color: primaryColor),
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                              ),
                                              hintText: "رقم البلاغ",
                                              //enabledBorder: InputBorder.none
                                            ),
                                            validator: (value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                return 'برجاء إدخال رقم البلاغ ';
                                              } else if (value.length < 36) {
                                                return 'برجاء إدخال 36 حرف ';
                                              } 
                                              return null;
                                            },
                                            onSaved: (value) {
                                              code = int.parse(value!);
                                            },
                                          ),
                                          SizedBox(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                50,
                                          ),
                                          InkWell(
                                            onTap: () async {
                                              // Validate returns true if the form is valid, or false otherwise.
                                              if (_formKey.currentState!
                                                  .validate()) {
                                                _formKey.currentState!.save();
                                                Navigator.pop(ctx);
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                          const OrderWithCodeScreen()
                                                            ));
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
                                                gradient: const LinearGradient(
                                                    colors: [
                                                      lightPrimaryColor,
                                                      primaryColor,
                                                    ],
                                                    begin: FractionalOffset(
                                                        0.0, 0.0),
                                                    end: FractionalOffset(
                                                        1.0, 0.0),
                                                    stops: [0.0, 1.0],
                                                    tileMode: TileMode.clamp),
                                              ),
                                              child: const Text(
                                                "تأكيد رقم البلاغ ",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 18),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              });
                        
                        },
                        child: Container(
                          alignment: Alignment.center,
                          width: MediaQuery.of(context).size.width / 1.6,
                          height: MediaQuery.of(context).size.height / 14,
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
                            'تتبع البلاغ عن طريق رقم البلاغ ',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                                color: Colors.white),
                          ),
                        ),
                      )


 */