import 'package:flutter/material.dart';
import 'package:fly/utils/style.dart';
import 'package:fly/view/nav_bar.dart';
import 'package:get/get.dart';

import 'signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String? userName = '';

  String password = '';

  bool vis = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
              child: Column(
        children: [
          Container(
            height: 300,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(90)),
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
                  decoration: BoxDecoration(
                      border: Border.all(width: 2, color: primaryColor),
                      borderRadius: BorderRadius.circular(60)),
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(width: 2, color: Colors.white),
                        borderRadius: BorderRadius.circular(60)),
                    //margin: const EdgeInsets.only(top: 50),
                    child: Image.asset(
                      "assets/images/logo.png",
                      height: 100,
                      width: 100,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(right: 20, top: 20),
                  alignment: Alignment.bottomRight,
                  child: const Text(
                    "Login",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                )
              ],
            )),
          ),
          Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.only(left: 20, right: 20, top: 70),
            padding: const EdgeInsets.only(left: 20, right: 20),
            height: 54,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Colors.grey[200],
              boxShadow: const [
                BoxShadow(
                    offset: Offset(0, 10),
                    blurRadius: 50,
                    color: Color(0xffEEEEEE)),
              ],
            ),
            child: const TextField(
              cursorColor: primaryColor,
              decoration: InputDecoration(
                icon: Icon(
                  Icons.email,
                  color: primaryColor,
                ),
                hintText: "Enter Email",
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
            padding: const EdgeInsets.only(left: 20, right: 20),
            height: 54,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: const Color(0xffEEEEEE),
              boxShadow: const [
                BoxShadow(
                    offset: Offset(0, 20),
                    blurRadius: 100,
                    color: Color(0xffEEEEEE)),
              ],
            ),
            child: const TextField(
              cursorColor: primaryColor,
              decoration: InputDecoration(
                focusColor: primaryColor,
                icon: Icon(
                  Icons.vpn_key,
                  color: primaryColor,
                ),
                hintText: "Enter Password",
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            alignment: Alignment.centerRight,
            child: GestureDetector(
              onTap: () {
                // Write Click Listener Code Here
              },
              child: const Text("Forget Password?"),
            ),
          ),
          GestureDetector(
            onTap: () {
              Get.offAll(() => const CustomNavBar());
            },
            child: Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.only(left: 20, right: 20, top: 70),
              padding: const EdgeInsets.only(left: 20, right: 20),
              height: 54,
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
                "LOGIN",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Don't Have Any Account?  "),
                GestureDetector(
                  child: const Text(
                    "Register Now",
                    style: TextStyle(color: primaryColor),
                  ),
                  onTap: () {
                    // Write Tap Code Here.
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignUpScreen(),
                        ));
                  },
                )
              ],
            ),
          )
        ],
      ))),
    );
  }
}


/*
Form(
            key: _formKey,
            child: Column(
              children: [
                const HeaderWidget(),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 7,
                ),
                Text(
                  "login".tr,
                  style:
                      const TextStyle(fontSize: 35, fontFamily: 'hanimation'),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 20,
                ),

                /// user name field
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  margin: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width / 14,
                  ),
                  child: TextFormField(
                    onSaved: (value) {
                      userName = value;
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'برجاء إدخال الاسم للتمكن من الدخول';
                      } else {
                        return null;
                      }
                    },
                    keyboardType: TextInputType.name,
                    cursorColor: primaryColor,
                    decoration: InputDecoration(
                        prefixIcon: const Icon(
                          Icons.person_outline,
                          color: primaryColor,
                          size: 30,
                        ),
                        hintText: 'user name'.tr,
                        border: InputBorder.none),
                  ),
                ),

                /// passowrd
                SizedBox(
                  height: MediaQuery.of(context).size.height / 30,
                ),

                StatefulBuilder(builder: (context, setter) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    //    height: MediaQuery.of(context).size.height / 11,
                    margin: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width / 14),
                    child: TextFormField(
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: vis,
                      cursorColor: primaryColor,
                      onChanged: (value) {
                        setter(() {
                          password = value;
                        });
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'برجاء إدخال الرقم السري للتمكن من الدخول  ';
                        } else if (value.length < 8) {
                          return 'برجاء إدخال الرقم السري اكثر من 8 حروف';
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                          contentPadding: const EdgeInsets.only(bottom: 5),
                          prefixIcon: const Icon(
                            Icons.lock,
                            color: primaryColor,
                            size: 30,
                          ),
                          suffix: IconButton(
                            onPressed: () {
                              setter(() {
                                vis = !vis;
                              });
                            },
                            iconSize: 22,
                            // padding: EdgeInsets.only(top: 22),
                            // alignment: Alignment.bottomCenter,
                            icon: Icon(
                              vis == true
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: primaryColor,
                            ),
                          ),
                          hintText: 'password'.tr,
                          border: InputBorder.none),
                    ),
                  );
                }),

                /// login button
                SizedBox(
                  height: MediaQuery.of(context).size.height / 35,
                ),
                InkWell(
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();

                      Get.off(const HomeScreen());
                    }
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height / 15,
                    margin: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width / 10),
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
                )
              ],
            ),
          ),


 */