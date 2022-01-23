import 'package:flutter/material.dart';
import 'package:fly/core/controller/image_picker_controller.dart';
import 'package:fly/utils/style.dart';
import 'package:fly/view/shared_widgets/header_widget.dart';
import 'package:get/get.dart';
import 'package:hawk_fab_menu/hawk_fab_menu.dart';

class BugReportScreen extends StatelessWidget {
  const BugReportScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<ImagePickerController>(
        init: ImagePickerController(),
        builder: (controller){
        return HawkFabMenu(
        openIcon: Icons.add,
        blur: 0.4,
        fabColor: Colors.yellow,
        iconColor: primaryColor,
        closeIcon: Icons.close,
        items: [
          HawkFabMenuItem(
              label: 'add location'.tr,
              ontap: () {

              },
              icon: const Icon(Icons.maps_ugc),
              color: primaryColor,
              labelColor: lightPrimaryColor,
              labelBackgroundColor: Colors.white),
          HawkFabMenuItem(
              label: 'add picture'.tr,
              ontap: () {
                controller.pickImageFromGallrey();
              },
              icon: const Icon(Icons.image),
              color: primaryColor,
              labelColor: lightPrimaryColor,
              labelBackgroundColor: Colors.white),
          HawkFabMenuItem(
              label: 'take picture'.tr,
              ontap: () {
                controller.pickImageFromCam();
              },
              icon: const Icon(Icons.add_a_photo),
              color: primaryColor,
              labelColor: lightPrimaryColor,
              labelBackgroundColor: Colors.white),
        ],
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const HeaderWidget(arrow: true),
                const SizedBox(
                  height: 430,
                ),
                   controller.image != null
                        ? ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.file(
                              controller.image!,
                              width: 100,
                              height: 100,
                              fit: BoxFit.cover,
                            ),
                        )
                        : Container(
                          alignment: Alignment.center,
                          width: 120,
                            height: 60,
                          decoration: BoxDecoration(
                            color: redColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child:const Text('برجاء إرفاق صورة للبلاغ',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontFamily: 'hanimation',
                            fontWeight: FontWeight.w400
                          ),
                          ),
                        ),
              ],
            ),
          ),
        ),
      ) ; 
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


 */