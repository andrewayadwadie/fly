import 'package:flutter/material.dart';
import 'package:fly/utils/style.dart';

import 'package:get/get.dart';

class ProjectListDetails extends StatefulWidget {
  const ProjectListDetails({Key? key}) : super(key: key);

  @override
  _ProjectListDetailsState createState() => _ProjectListDetailsState();
}

class _ProjectListDetailsState extends State<ProjectListDetails> {
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
    );
  }
}
