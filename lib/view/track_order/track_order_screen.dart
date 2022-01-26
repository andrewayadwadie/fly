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


