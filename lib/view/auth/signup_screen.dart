import 'package:flutter/material.dart';
import 'package:fly/utils/style.dart';
import 'package:fly/view/auth/signup_otp_screen.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  String? phone = '';
  String? name = '';
  String? password = '';
  String? confirmPassword = '';
  String? ssn;

  bool vis = true;
  bool confirmVis = true;

  final  _signupFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            reverse: true,
            child: Column(
              children: [
                Container(
                  height: 250,
                  decoration: const BoxDecoration(
                    borderRadius:
                        BorderRadius.only(bottomLeft: Radius.circular(90)),
                    color: primaryColor,
                    gradient: LinearGradient(
                      colors: [(primaryColor), lightPrimaryColor],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                  child: Center(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 50),
                        child: Image.asset(
                          "assets/images/logo.png",
                          height: 90,
                          width: 90,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(right: 20, top: 20),
                        alignment: Alignment.bottomRight,
                        child: const Text(
                          "?????????? ???????? ???????? ",
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      )
                    ],
                  )),
                ),
                Form(
                  key: _signupFormKey,
                  child: Column(
                    children: [
                      // name =======
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 40, right: 40, top: 30),
                        child: TextFormField(
                          keyboardType: TextInputType.text,
                          cursorColor: primaryColor,
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
                              icon: const Icon(
                                Icons.person,
                                color: primaryColor,
                                size: 25,
                              ),
                              labelText: "?????? ????????????????",
                              hintText: "?????? ????????????????",
                              labelStyle: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold)
                              //enabledBorder: InputBorder.none
                              ),
                          onSaved: (val) {
                            name = val;
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return '?????????? ?????????? ?????? ???????????????? ';
                            } else {
                              return null;
                            }
                          },
                        ),
                      ),
                      // phone =============
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 40, right: 40, top: 20),
                        child: TextFormField(
                          keyboardType: TextInputType.phone,
                          cursorColor: primaryColor,
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
                              icon: const Icon(
                                Icons.phone_android,
                                color: primaryColor,
                                size: 25,
                              ),
                              labelText: "?????? ????????????",
                              hintText: "?????? ????????????",
                              labelStyle: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold)
                              //enabledBorder: InputBorder.none
                              ),
                          onSaved: (val) {
                            phone = val;
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return '?????????? ?????????? ?????? ???????????? ';
                            } else {
                              return null;
                            }
                          },
                        ),
                      ),
                      // SSn =============
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 40, right: 40, top: 20),
                        child: TextFormField(
                          keyboardType: TextInputType.phone,
                          cursorColor: primaryColor,
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
                              icon: const Icon(
                                Icons.card_membership,
                                color: primaryColor,
                                size: 25,
                              ),
                              labelText: "?????? ???????????? ",
                              hintText: "?????? ???????????? ",
                              labelStyle: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold)
                              //enabledBorder: InputBorder.none
                              ),
                          onSaved: (val) {
                            ssn = val;
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return '?????????? ?????????? ?????? ????????????  ';
                            } else {
                              return null;
                            }
                          },
                        ),
                      ),
                     
                     
                      // pssword ========
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 40, right: 40, top: 20),
                        child: StatefulBuilder(builder: (context, setter) {
                          return TextFormField(
                            obscureText: vis,
                            keyboardType: TextInputType.visiblePassword,
                            cursorColor: primaryColor,
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
                                icon: const Icon(
                                  Icons.vpn_key,
                                  color: primaryColor,
                                  size: 25,
                                ),
                                labelText: "???????? ????????????",
                                hintText: "???????? ????????????",
                                labelStyle: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                                suffix: GestureDetector(
                                  onTap: () {
                                    setter(() {
                                      vis = !vis;
                                    });
                                  },
                                  child: Icon(
                                    vis == true
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: primaryColor,
                                    size: 19,
                                  ),
                                )
                                //enabledBorder: InputBorder.none
                                ),
                            onChanged: (val) {
                              setter(() {
                                password = val;
                              });
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return '?????????? ?????????? ???????? ???????????? ';
                              } else if (value.length < 8) {
                                return '???????? ???????????? ?????? ???? ???????? ???????? ???? 8 ???????? ';
                              } else {
                                return null;
                              }
                            },
                          );
                        }),
                      ),
                      // confirm password ========
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 40, right: 40, top: 20),
                        child: StatefulBuilder(builder: (context, setter) {
                          return TextFormField(
                            obscureText: confirmVis,
                            keyboardType: TextInputType.visiblePassword,
                            cursorColor: primaryColor,
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
                                icon: const Icon(
                                  Icons.password,
                                  color: primaryColor,
                                  size: 25,
                                ),
                                labelText: "?????????? ???????? ???????????? ",
                                hintText: "?????????? ???????? ???????????? ",
                                labelStyle: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                                suffix: GestureDetector(
                                  onTap: () {
                                    setter(() {
                                      confirmVis = !confirmVis;
                                    });
                                  },
                                  child: Icon(
                                    confirmVis == true
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: primaryColor,
                                    size: 19,
                                  ),
                                )
                                //enabledBorder: InputBorder.none
                                ),
                            onChanged: (val) {
                              setter(() {
                                confirmPassword = val;
                              });
                            },
                            //enabledBorder: InputBorder.none

                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return '?????????? ?????????? ???????? ????????????';
                              } else if (password != confirmPassword) {
                                return '???????????????????? ?????? ?????????????? ';
                              } else {
                                return null;
                              }
                            },
                          );
                        }),
                      ),
                      // submit button ==========
                      GestureDetector(
                        onTap: () {
                          if (_signupFormKey.currentState!.validate()) {
                            _signupFormKey.currentState!.save();
                            Get.to(()=>  SignupOtpScreen(
                              name: name!,
                              phone: phone!,
                              password: password!,
                              ssn: ssn!,
                            ));
                          }
                        },
                        child: Container(
                          alignment: Alignment.center,
                          margin: const EdgeInsets.only(
                              left: 20, right: 20, top: 30),
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          height: MediaQuery.of(context).size.height / 14,
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                                colors: [(primaryColor), lightPrimaryColor],
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight),
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.grey[200],
                            boxShadow: const [
                              BoxShadow(
                                  offset: Offset(0, 10),
                                  blurRadius: 50,
                                  color: Color(0xffEEEEEE)),
                            ],
                          ),
                          child: const Text(
                            "?????????? ???????? ????????",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // login ==============>>>>>>>>
                Container(
                  margin: const EdgeInsets.only(top: 10, bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("???????? ???????? ???????????? ?? "),
                      GestureDetector(
                        child: const Text(
                          "?????????? ????????????",
                          style: TextStyle(color: primaryColor),
                        ),
                        onTap: () {
                          // Write Tap Code Here.
                          Navigator.pop(context);
                        },
                      )
                    ],
                  ),
                )
              ],
            )));
  }
}
