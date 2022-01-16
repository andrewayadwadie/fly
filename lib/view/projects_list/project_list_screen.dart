import 'package:flutter/material.dart';

import 'package:fly/utils/style.dart';
import 'package:fly/view/shared_widgets/public_screen_body.dart';

import 'project_list_details.dart';

class ProjectListScreen extends StatefulWidget {
  const ProjectListScreen({Key? key}) : super(key: key);

  @override
  _ProjectListScreenState createState() => _ProjectListScreenState();
}

class _ProjectListScreenState extends State<ProjectListScreen> {
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.only(bottom: 15),
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  width: MediaQuery.of(context).size.width / 3,
                  height: MediaQuery.of(context).size.height / 15,
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: lightPrimaryColor),
                      borderRadius: BorderRadiusDirectional.circular(10)),
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
                  width: MediaQuery.of(context).size.width / 3,
                  height: MediaQuery.of(context).size.height / 15,
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: lightPrimaryColor),
                      borderRadius: BorderRadiusDirectional.circular(10)),
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
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 15),
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  width: MediaQuery.of(context).size.width / 3,
                  height: MediaQuery.of(context).size.height / 15,
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: lightPrimaryColor),
                      borderRadius: BorderRadiusDirectional.circular(10)),
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
                  width: MediaQuery.of(context).size.width / 3,
                  height: MediaQuery.of(context).size.height / 15,
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: lightPrimaryColor),
                      borderRadius: BorderRadiusDirectional.circular(10)),
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
              ],
            ),

            //------------------ end first fields-------------------------//

            ///button
            SizedBox(
              height: MediaQuery.of(context).size.height / 80,
            ),
            InkWell(
              onTap: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                }
              },
              child: Container(
                width: MediaQuery.of(context).size.width / 5,
                height: MediaQuery.of(context).size.height / 15,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: primaryColor,
                ),
                alignment: Alignment.center,
                child: const Icon(
                  Icons.search,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 80,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 1.1,
              height: MediaQuery.of(context).size.height / 2.5,
              child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return const PublicScreenBody(
                            singleScreen: ProjectListDetails(),
                            title: 'project details',
                          );
                        }));
                      },
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 15),
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width / 1.2,
                        height: MediaQuery.of(context).size.height / 20,
                        decoration: BoxDecoration(
                            color: Colors.grey.shade400,
                            borderRadius: BorderRadius.circular(20)),
                        child: const Text(
                          "تفاصيل المهمة",
                          style: TextStyle(color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
