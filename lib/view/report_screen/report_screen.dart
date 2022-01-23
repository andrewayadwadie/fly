import 'package:flutter/material.dart';
import 'package:fly/utils/style.dart';
import 'package:fly/view/reports_categories/bug_report/bug_report_screen.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:get/get.dart';

class ReportScreen extends StatefulWidget {
  const ReportScreen({Key? key}) : super(key: key);

  @override
  _ReportScreenState createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  // final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // String? userName = '';

  final List<String> titles = [
    'Report insect area',
    'Report a stray or ferocious animal area',
    'Report a leaking area or water gathering',
    'Track of my reports'
  ];
  final List<Widget> screens = [
    const BugReportScreen(),
    const BugReportScreen(),
    const BugReportScreen(),
    const BugReportScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      //  margin: EdgeInsets.only(top: MediaQuery.of(context).size.height / 50),
      padding: const EdgeInsets.only(top: 50),
      width: MediaQuery.of(context).size.width / 1.1,
      height: MediaQuery.of(context).size.height / 1.4,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: GridView.builder(
          padding: const EdgeInsets.only(right: 10, left: 10, bottom: 10),
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 2 / 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20),
          itemCount: 4,
          itemBuilder: (BuildContext ctx, index) {
            return InkWell(
              onTap: () {
                // Get.to(screens[index]);
                pushNewScreen(context, screen: screens[index]);
              },
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/re$index.jpg'),
                      fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(width: 1, color: lightPrimaryColor),
                  color: Colors.white,
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: Colors.black.withOpacity(0.6),
                      blurRadius: 6,
                      offset: const Offset(2, 4),
                    ),
                  ],
                ),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 17,
                    decoration: const BoxDecoration(
                        color: lightPrimaryColor,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(60),
                            topLeft: Radius.circular(60),
                            bottomRight: Radius.circular(35),
                            bottomLeft: Radius.circular(35))),
                    child: Text(
                      titles[index].tr,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          height: 1.2,
                          fontSize: 15,
                          fontFamily: 'hanimation',
                          // fontWeight: FontWeight.bold,
                          color: Colors.white),
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
                          singleScreen: ReportDetailsScreen(),
                          title: 'report details',
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
    )
    

 */