import 'package:auto_size_text/auto_size_text.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fly/core/controller/code_oreders_controller.dart';
import 'package:fly/utils/constants.dart';
import 'package:fly/utils/style.dart';
import 'package:fly/view/shared_widgets/custom_loader.dart';
import 'package:fly/view/shared_widgets/custom_no_data.dart';
import 'package:fly/view/shared_widgets/header_widget.dart';
import 'package:fly/view/shared_widgets/line_dot.dart';
import 'package:get/get.dart';

class OrderWithCodeScreen extends StatelessWidget {
  const OrderWithCodeScreen({Key? key, required this.phone, required this.code})
      : super(key: key);
  final int phone;
  final String code;
  @override
  Widget build(BuildContext context) {
    // CodeOrdersController control = Get.put(CodeOrdersController(code));
    return Scaffold(
      body: SafeArea(
        child: GetBuilder<CodeOrdersController>(
            init: CodeOrdersController(code),
            builder: (controller) {
              return controller.loading == true
                  ? const LoaderWidget()
                  : SingleChildScrollView(
                      child: Column(
                        children: [
                          //header
                          const HeaderWidget(arrow: true),
                          //
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 20,
                          ),
                          // title
                          Container(
                            alignment: Alignment.center,
                            width: MediaQuery.of(context).size.width / 3,
                            height: MediaQuery.of(context).size.height / 20,
                            // decoration: BoxDecoration(
                            //     border: Border.all(
                            //   width: 1,
                            //   color: primaryColor,
                            // )),
                            child: const Text(
                              "???????????? ????????????",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: primaryColor,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          // divider
                          const LineDots(),
                          //Report List
                          controller.orederByCode ==
                                  "???? ???????? ???????? ???????? ?????????? 00000000-0000-0000-0000-000000000000"
                              ?
                              // NoData Widget
                              const NoDataWidget()
                              : Container(
                                  margin: const EdgeInsets.only(
                                      right: 10, left: 10, top: 10),
                                  height:
                                      MediaQuery.of(context).size.height / 1.59,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                      width: 2.0,
                                      color: primaryColor,
                                    ),
                                    borderRadius: BorderRadius.circular(12),
                                    boxShadow: <BoxShadow>[
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.6),
                                        blurRadius: 6,
                                        offset: const Offset(3, 5),
                                      ),
                                    ],
                                  ),
                                  child: ListView(
                                    children: [
                                      // report type
                                      Container(
                                        height:
                                            MediaQuery.of(context).size.height /
                                                18,
                                        decoration: BoxDecoration(
                                            color: lightPrimaryColor
                                                .withOpacity(0.1),
                                            border: const Border(
                                              right: BorderSide(
                                                //                   <--- left side
                                                color: primaryColor,
                                                width: 8.0,
                                              ),
                                              left: BorderSide(
                                                //                   <--- left side
                                                color: primaryColor,
                                                width: 1.0,
                                              ),
                                              top: BorderSide(
                                                //                   <--- left side
                                                color: primaryColor,
                                                width: 1.0,
                                              ),
                                              bottom: BorderSide(
                                                //                   <--- left side
                                                color: primaryColor,
                                                width: 1.0,
                                              ),
                                            )),
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 5),
                                        padding:
                                            const EdgeInsets.only(right: 5),
                                        child: Row(
                                          children: [
                                            const CircleAvatar(
                                              radius: 7,
                                              backgroundColor:
                                                  lightPrimaryColor,
                                            ),
                                            const SizedBox(
                                              width: 8,
                                            ),
                                            const AutoSizeText(
                                              "?????? ???????????? : ",
                                              style: TextStyle(
                                                  color: primaryColor,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            AutoSizeText(
                                              controller.orederByCode
                                                  .noticeClassifyType,
                                              style: const TextStyle(
                                                  color: blackColor,
                                                  fontSize: 15),
                                            )
                                          ],
                                        ),
                                      ),
                                      // report description
                                      Container(
                                        height:
                                            MediaQuery.of(context).size.height /
                                                18,
                                        decoration: BoxDecoration(
                                            color: lightPrimaryColor
                                                .withOpacity(0.1),
                                            border: const Border(
                                              right: BorderSide(
                                                //                   <--- left side
                                                color: primaryColor,
                                                width: 8.0,
                                              ),
                                              left: BorderSide(
                                                //                   <--- left side
                                                color: primaryColor,
                                                width: 1.0,
                                              ),
                                              top: BorderSide(
                                                //                   <--- left side
                                                color: primaryColor,
                                                width: 1.0,
                                              ),
                                              bottom: BorderSide(
                                                //                   <--- left side
                                                color: primaryColor,
                                                width: 1.0,
                                              ),
                                            )),
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 5),
                                        padding:
                                            const EdgeInsets.only(right: 5),
                                        child: Row(
                                          children: [
                                            const CircleAvatar(
                                              radius: 7,
                                              backgroundColor:
                                                  lightPrimaryColor,
                                            ),
                                            const SizedBox(
                                              width: 8,
                                            ),
                                            const AutoSizeText(
                                              "?????? ???????????? : ",
                                              style: TextStyle(
                                                  color: primaryColor,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            AutoSizeText(
                                              controller.orederByCode.text,
                                              maxLines: 3,
                                              style: const TextStyle(
                                                  color: blackColor,
                                                  fontSize: 15),
                                            )
                                          ],
                                        ),
                                      ),
                                      //report date
                                      Container(
                                        height:
                                            MediaQuery.of(context).size.height /
                                                18,
                                        decoration: BoxDecoration(
                                            color: lightPrimaryColor
                                                .withOpacity(0.1),
                                            border: const Border(
                                              right: BorderSide(
                                                //                   <--- left side
                                                color: primaryColor,
                                                width: 8.0,
                                              ),
                                              left: BorderSide(
                                                //                   <--- left side
                                                color: primaryColor,
                                                width: 1.0,
                                              ),
                                              top: BorderSide(
                                                //                   <--- left side
                                                color: primaryColor,
                                                width: 1.0,
                                              ),
                                              bottom: BorderSide(
                                                //                   <--- left side
                                                color: primaryColor,
                                                width: 1.0,
                                              ),
                                            )),
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 5),
                                        padding:
                                            const EdgeInsets.only(right: 5),
                                        child: Row(
                                          children: [
                                            const CircleAvatar(
                                              radius: 7,
                                              backgroundColor:
                                                  lightPrimaryColor,
                                            ),
                                            const SizedBox(
                                              width: 8,
                                            ),
                                            const AutoSizeText(
                                              "?????????? ???????????? : ",
                                              style: TextStyle(
                                                  color: primaryColor,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            AutoSizeText(
                                              controller.orederByCode.date
                                                  .substring(0, 10),
                                              style: const TextStyle(
                                                  color: blackColor,
                                                  fontSize: 15),
                                            )
                                          ],
                                        ),
                                      ),
                                      // phone Number
                                      Container(
                                        height:
                                            MediaQuery.of(context).size.height /
                                                18,
                                        decoration: BoxDecoration(
                                            color: lightPrimaryColor
                                                .withOpacity(0.1),
                                            border: const Border(
                                              right: BorderSide(
                                                //                   <--- left side
                                                color: primaryColor,
                                                width: 8.0,
                                              ),
                                              left: BorderSide(
                                                //                   <--- left side
                                                color: primaryColor,
                                                width: 1.0,
                                              ),
                                              top: BorderSide(
                                                //                   <--- left side
                                                color: primaryColor,
                                                width: 1.0,
                                              ),
                                              bottom: BorderSide(
                                                //                   <--- left side
                                                color: primaryColor,
                                                width: 1.0,
                                              ),
                                            )),
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 5),
                                        padding:
                                            const EdgeInsets.only(right: 5),
                                        child: Row(
                                          children: [
                                            const CircleAvatar(
                                              radius: 7,
                                              backgroundColor:
                                                  lightPrimaryColor,
                                            ),
                                            const SizedBox(
                                              width: 8,
                                            ),
                                            const AutoSizeText(
                                              "?????? ???????????? : ",
                                              style: TextStyle(
                                                  color: primaryColor,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            AutoSizeText(
                                              "0$phone",
                                              style: const TextStyle(
                                                  color: blackColor,
                                                  fontSize: 15),
                                            )
                                          ],
                                        ),
                                      ),
                                      // report code
                                      Container(
                                        height:
                                            MediaQuery.of(context).size.height /
                                                18,
                                        decoration: BoxDecoration(
                                            color: lightPrimaryColor
                                                .withOpacity(0.1),
                                            border: const Border(
                                              right: BorderSide(
                                                //                   <--- left side
                                                color: primaryColor,
                                                width: 8.0,
                                              ),
                                              left: BorderSide(
                                                //                   <--- left side
                                                color: primaryColor,
                                                width: 1.0,
                                              ),
                                              top: BorderSide(
                                                //                   <--- left side
                                                color: primaryColor,
                                                width: 1.0,
                                              ),
                                              bottom: BorderSide(
                                                //                   <--- left side
                                                color: primaryColor,
                                                width: 1.0,
                                              ),
                                            )),
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 5),
                                        padding:
                                            const EdgeInsets.only(right: 5),
                                        child: Row(
                                          children: [
                                            const CircleAvatar(
                                              radius: 7,
                                              backgroundColor:
                                                  lightPrimaryColor,
                                            ),
                                            const SizedBox(
                                              width: 8,
                                            ),
                                            const AutoSizeText(
                                              "?????? ???????????? : ",
                                              style: TextStyle(
                                                  color: primaryColor,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            AutoSizeText(
                                              code,
                                              style: const TextStyle(
                                                  color: blackColor,
                                                  fontSize: 8),
                                            )
                                          ],
                                        ),
                                      ),
                                      // report Status
                                      Container(
                                        height:
                                            MediaQuery.of(context).size.height /
                                                18,
                                        decoration: BoxDecoration(
                                            color: lightPrimaryColor
                                                .withOpacity(0.1),
                                            border: const Border(
                                              right: BorderSide(
                                                //                   <--- left side
                                                color: primaryColor,
                                                width: 8.0,
                                              ),
                                              left: BorderSide(
                                                //                   <--- left side
                                                color: primaryColor,
                                                width: 1.0,
                                              ),
                                              top: BorderSide(
                                                //                   <--- left side
                                                color: primaryColor,
                                                width: 1.0,
                                              ),
                                              bottom: BorderSide(
                                                //                   <--- left side
                                                color: primaryColor,
                                                width: 1.0,
                                              ),
                                            )),
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 5),
                                        padding:
                                            const EdgeInsets.only(right: 5),
                                        child: Row(
                                          children: [
                                            const CircleAvatar(
                                              radius: 7,
                                              backgroundColor:
                                                  lightPrimaryColor,
                                            ),
                                            const SizedBox(
                                              width: 8,
                                            ),
                                            const AutoSizeText(
                                              "???????? ???????????? : ",
                                              style: TextStyle(
                                                  color: primaryColor,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            AutoSizeText(
                                              controller.orederByCode.status,
                                              style: const TextStyle(
                                                  color: blackColor,
                                                  fontSize: 15),
                                            )
                                          ],
                                        ),
                                      ),
                                      //report Images
                                      Container(
                                        height:
                                            MediaQuery.of(context).size.height /
                                                6,
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 5),
                                        padding: const EdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                            //  color: lightPrimaryColor.withOpacity(0.1),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            border: Border.all(
                                                width: 2, color: primaryColor)),
                                        child: ListView.builder(
                                            scrollDirection: Axis.vertical,
                                            itemCount: controller
                                                .orederByCode.photos.length,
                                            itemBuilder: (context, index) {
                                              return Container(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height /
                                                    9,
                                                margin:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 15,
                                                        vertical: 10),
                                                decoration: BoxDecoration(
                                                    //   border: Border.all(width: 1,color: redColor),
                                                    image: DecorationImage(
                                                        image: NetworkImage(
                                                            '$imageUrl${controller.orederByCode.photos[index]}'))),
                                              );
                                            }),
                                      )
                                    ],
                                  ),
                                ),
                          if (controller.orederByCode !=
                              "???? ???????? ???????? ???????? ?????????? 00000000-0000-0000-0000-000000000000")
                            controller.orederByCode.status == "?????? ????????????????"
                                ? InkWell(
                                    onTap: () {
                                      CoolAlert.show(
                                        confirmBtnText: "??????????",
                                        confirmBtnColor: primaryColor,
                                        backgroundColor: lightPrimaryColor,
                                        onConfirmBtnTap: () {
                                          Navigator.pop(context);
                                        },
                                        context: context,
                                        type: CoolAlertType.custom,
                                        widget: Container(
                                          alignment: Alignment.center,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              10,
                                          child: const AutoSizeText(
                                            "???? ?????????? ??????????  ?????????? ???? ?????????????? ???? ???????? ?????? ???????? ",
                                            maxLines: 2,
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: primaryColor,
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      );
                                    },
                                    child: Container(
                                      alignment: Alignment.center,
                                      margin: const EdgeInsets.only(top: 10),
                                      width:
                                          MediaQuery.of(context).size.width / 2,
                                      height:
                                          MediaQuery.of(context).size.height /
                                              15,
                                      decoration: BoxDecoration(
                                          color: lightPrimaryColor,
                                          border: Border.all(
                                              width: 2, color: primaryColor),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Container(
                                            width: 40,
                                            height: 40,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                image: const DecorationImage(
                                                    image: AssetImage(
                                                        "assets/icons/warning.png"),
                                                    fit: BoxFit.cover)),
                                          ),
                                          const Text(
                                            "?????????????? ???????????? ",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 15),
                                          )
                                        ],
                                      ),
                                    ),
                                  )
                                : InkWell(
                                    onTap: () {
                                      CoolAlert.show(
                                          title: "???? ???? ???? ?????????????? ?? ",
                                          confirmBtnText: "??????",
                                          cancelBtnText: "???? ",
                                          cancelBtnTextStyle: const TextStyle(
                                              color: primaryColor,
                                              fontSize: 16),
                                          confirmBtnColor: primaryColor,
                                          backgroundColor: lightPrimaryColor,
                                          onConfirmBtnTap: () {
                                            Navigator.pop(context);
                                            Fluttertoast.showToast(
                                                msg: "?????????? ???????????????? ???????? ",
                                                timeInSecForIosWeb: 3,
                                                gravity: ToastGravity.CENTER,
                                                toastLength: Toast.LENGTH_LONG,
                                                fontSize: 20,
                                                textColor: Colors.white,
                                                backgroundColor: redColor);
                                          },
                                          context: context,
                                          type: CoolAlertType.confirm,
                                          onCancelBtnTap: () {
                                            Navigator.pop(context);
                                            Fluttertoast.showToast(
                                                msg:
                                                    "???????? ???????????? ???????????? ?????? ???????? ???????????? ???? ???? ?????????????? ",
                                                timeInSecForIosWeb: 3,
                                                gravity: ToastGravity.CENTER,
                                                toastLength: Toast.LENGTH_LONG,
                                                fontSize: 16,
                                                textColor: Colors.white,
                                                backgroundColor: redColor);
                                          });
                                    },
                                    child: Container(
                                      alignment: Alignment.center,
                                      margin: const EdgeInsets.only(top: 10),
                                      width:
                                          MediaQuery.of(context).size.width / 2,
                                      height:
                                          MediaQuery.of(context).size.height /
                                              15,
                                      decoration: BoxDecoration(
                                          color: lightPrimaryColor,
                                          border: Border.all(
                                              width: 2, color: primaryColor),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Container(
                                            width: 40,
                                            height: 40,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                image: const DecorationImage(
                                                    image: AssetImage(
                                                        "assets/icons/warning.png"),
                                                    fit: BoxFit.cover)),
                                          ),
                                          const Text(
                                            "???? ???? ???? ????????????????",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 13),
                                          )
                                        ],
                                      ),
                                    ),
                                  )
                        ],
                      ),
                    );
            }),
      ),
    );
  }
}
