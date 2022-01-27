import 'package:cool_alert/cool_alert.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fly/core/db/auth_shared_preferences.dart';
import 'package:fly/core/service/auth_services.dart';
import 'package:fly/view/on_board/on_board_screen.dart';
import 'package:fly/view/track_order/track_order_screen.dart';
import 'package:get/get.dart';
import 'package:pinput/pin_put/pin_put.dart';

import 'package:fly/utils/style.dart';
import 'package:fly/view/shared_widgets/header_widget.dart';

class LoginOtpScreen extends StatelessWidget {
  LoginOtpScreen({
    Key? key,
    required this.ssn,
    required this.password,
  }) : super(key: key);

  final String ssn;
  final String password;

  final TextEditingController _pinPutController = TextEditingController();

  final FocusNode _pinPutFocusNode = FocusNode();

  BoxDecoration get _pinPutDecoration {
    return BoxDecoration(
      border: Border.all(color: primaryColor),
      borderRadius: BorderRadius.circular(15.0),
    );
  }

  bool isCodeSent = false;
  String _verificationId = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          reverse: true,
          child: Column(
            children: [
              const HeaderWidget(arrow: true),
              SizedBox(
                height: MediaQuery.of(context).size.height / 8,
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
                          offset: const Offset(2, 4),
                        ),
                      ],
                      borderRadius: BorderRadius.circular(40),
                      border: Border.all(width: 2, color: lightPrimaryColor)),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 2.4,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Directionality(
                          textDirection: TextDirection.ltr,
                          child: PinPut(
                            fieldsCount: 6,
                            onSubmit: (String pin) async {},
                            focusNode: _pinPutFocusNode,
                            controller: _pinPutController,
                            submittedFieldDecoration:
                                _pinPutDecoration.copyWith(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            selectedFieldDecoration: _pinPutDecoration,
                            followingFieldDecoration:
                                _pinPutDecoration.copyWith(
                              borderRadius: BorderRadius.circular(5.0),
                              border: Border.all(
                                color: primaryColor,
                              ),
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () async {
                          var res = await AuthServices.login(
                              ssn: ssn, password: password);
                          if (res.runtimeType == List) {
                            TokenPref.setTokenValue(res[0].toString());
                            ExpireDatePref.setExpireDateValue(
                                res[1].toString());
                            UserNamePref.setUserNameValue(res[2].toString());
                            UserPhonePref.setUserPhoneValue(res[3].toString());
                            UserSSNPref.setUserSsnValue(res[4].toString());
                            Get.offAll(() => const OnBoardScreen());
                          } else if (res.runtimeType == String) {
                            CoolAlert.show(
                              context: context,
                              type: CoolAlertType.error,
                              title: res.toString(),
                              barrierDismissible: false,
                              animType: CoolAlertAnimType.slideInUp,
                              onConfirmBtnTap: () {
                                Navigator.pop(context);
                              },
                              confirmBtnColor: redColor,
                              confirmBtnText: "حسناً",
                              confirmBtnTextStyle: const TextStyle(),
                              backgroundColor: redColor,
                            );
                          }
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
                            'تأكيد',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                                color: Colors.white),
                          ),
                        ),
                      )
                    ],
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
