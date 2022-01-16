import 'package:flutter/material.dart';
import 'package:fly/utils/style.dart';

import 'package:get/get.dart';

class PreparationScreen extends StatefulWidget {
  const PreparationScreen({Key? key}) : super(key: key);

  @override
  State<PreparationScreen> createState() => _PreparationScreenState();
}

class _PreparationScreenState extends State<PreparationScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String? userName = '';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Form(
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
                //textAlignVertical: TextAlignVertical.center,
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
                // textAlignVertical: TextAlignVertical.center,
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
                // textAlignVertical: TextAlignVertical.center,
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
                // textAlignVertical: TextAlignVertical.center,
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.only(bottom: 5),
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  labelText: 'حقل إدخال ',
                  border: InputBorder.none,
                ),
              ),
            ),

            //------------------ end first fields-------------------------//

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 15),
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  width: MediaQuery.of(context).size.width / 1.5,
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
                    // textAlignVertical: TextAlignVertical.center,
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.only(bottom: 5),
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      labelText: 'حقل إدخال ',
                      border: InputBorder.none,
                    ),
                  ),
                ),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.upload_rounded,
                      color: lightPrimaryColor,
                      size: 40,
                    ))
              ],
            ),
            Row(
              children: [
                Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width / 7,
                  height: MediaQuery.of(context).size.height / 15,
                  decoration: BoxDecoration(
                      color: lightPrimaryColor,
                      border: Border.all(width: 3, color: lightPrimaryColor),
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(30),
                        bottomRight: Radius.circular(30),
                      )),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.download,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  width: MediaQuery.of(context).size.width / 1.4,
                  height: MediaQuery.of(context).size.height / 15,
                  decoration: BoxDecoration(
                      color: greyColor,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(30),
                        bottomLeft: Radius.circular(30),
                      )),
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
                    // textAlignVertical: TextAlignVertical.center,
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.only(bottom: 5),
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      labelText: 'حقل إدخال ',
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 50,
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 5),
              padding: const EdgeInsets.symmetric(horizontal: 12),
              width: MediaQuery.of(context).size.width / 1.2,
              height: MediaQuery.of(context).size.height / 11,
              decoration: BoxDecoration(
                  color: greyColor,
                  borderRadius: BorderRadiusDirectional.circular(5)),
              child: TextFormField(
                onSaved: (value) {
                  userName = value;
                },

                keyboardType: TextInputType.name,
                cursorColor: lightPrimaryColor,
                // textAlignVertical: TextAlignVertical.center,
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
    );
  }
}
