
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fly/core/controller/oreders_controller.dart';
import 'package:fly/utils/constants.dart';
import 'package:fly/utils/style.dart';
import 'package:fly/view/shared_widgets/custom_no_data.dart';
import 'package:fly/view/shared_widgets/header_widget.dart';
import 'package:fly/view/shared_widgets/line_dot.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class OrderPageScreen extends StatelessWidget {
  OrderPageScreen({Key? key, required this.phone, required this.id})
      : super(key: key);
  final int phone;
  final int id;
  int noticeClassifyId = 1;

  String text = '';

  String date = '';

  String lat = '';

  String long = '';

  String noticeClassifyType = '';

  String code = '';

  String status = '';

  List<dynamic> photos = [];

  @override
  Widget build(BuildContext context) {
    //  OrdersController controller = Get.put(OrdersController(phone));
    // for (dynamic item in controller.oredersByPhone) {
    //   if (item.id == id) {
    //     noticeClassifyId = item.noticeClassifyId;
    //     text = item.text;
    //     date = item.date;
    //     lat = item.lat;
    //     long = item.long;
    //     noticeClassifyType = item.noticeClassifyType;
    //     code = item.code;
    //     status = item.status;
    //     photos = item.photos;
    //   }
    // }

    return Scaffold(
      body: SafeArea(child: GetBuilder<OrdersController>(builder: (controller) {
        for (dynamic item in controller.oredersByPhone) {
          if (item.id == id) {
            noticeClassifyId = item.noticeClassifyId;
            text = item.text;
            date = item.date;
            lat = item.lat;
            long = item.long;
            noticeClassifyType = item.noticeClassifyType;
            code = item.code;
            status = item.status;
            photos = item.photos;
          }
        }
        return SingleChildScrollView(
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
                  "تفاصيل البلاغ",
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
              controller.oredersByPhone.isEmpty
                  ?
                  // NoData Widget
                  const NoDataWidget()
                  :
                  //====== Report Details  ========

                  Container(
                      margin:
                          const EdgeInsets.only(right: 10, left: 10, top: 10),
                      height: MediaQuery.of(context).size.height / 1.59,
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
                            height: MediaQuery.of(context).size.height / 18,
                            decoration: BoxDecoration(
                                color: lightPrimaryColor.withOpacity(0.1),
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
                            padding: const EdgeInsets.only(right: 5),
                            child: Row(
                              children: [
                                const CircleAvatar(
                                  radius: 7,
                                  backgroundColor: lightPrimaryColor,
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                const AutoSizeText(
                                  "نوع البلاغ : ",
                                  style: TextStyle(
                                      color: primaryColor,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                                AutoSizeText(
                                  noticeClassifyType,
                                  style: const TextStyle(
                                      color: blackColor, fontSize: 15),
                                )
                              ],
                            ),
                          ),
                          // report description
                          Container(
                            height: MediaQuery.of(context).size.height / 18,
                            decoration: BoxDecoration(
                                color: lightPrimaryColor.withOpacity(0.1),
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
                            padding: const EdgeInsets.only(right: 5),
                            child: Row(
                              children: [
                                const CircleAvatar(
                                  radius: 7,
                                  backgroundColor: lightPrimaryColor,
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                const AutoSizeText(
                                  "وصف البلاغ : ",
                                  style: TextStyle(
                                      color: primaryColor,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                                AutoSizeText(
                                  text,
                                  maxLines: 3,
                                  style: const TextStyle(
                                      color: blackColor, fontSize: 15),
                                )
                              ],
                            ),
                          ),
                          //report date
                          Container(
                            height: MediaQuery.of(context).size.height / 18,
                            decoration: BoxDecoration(
                                color: lightPrimaryColor.withOpacity(0.1),
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
                            padding: const EdgeInsets.only(right: 5),
                            child: Row(
                              children: [
                                const CircleAvatar(
                                  radius: 7,
                                  backgroundColor: lightPrimaryColor,
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                const AutoSizeText(
                                  "تاريخ البلاغ : ",
                                  style: TextStyle(
                                      color: primaryColor,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                                AutoSizeText(
                                  date.substring(0, 10),
                                  style: const TextStyle(
                                      color: blackColor, fontSize: 15),
                                )
                              ],
                            ),
                          ),
                          // phone Number
                          Container(
                            height: MediaQuery.of(context).size.height / 18,
                            decoration: BoxDecoration(
                                color: lightPrimaryColor.withOpacity(0.1),
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
                            padding: const EdgeInsets.only(right: 5),
                            child: Row(
                              children: [
                                const CircleAvatar(
                                  radius: 7,
                                  backgroundColor: lightPrimaryColor,
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                const AutoSizeText(
                                  "رقم الهاتف : ",
                                  style: TextStyle(
                                      color: primaryColor,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                                AutoSizeText(
                                  "0$phone",
                                  style: const TextStyle(
                                      color: blackColor, fontSize: 15),
                                )
                              ],
                            ),
                          ),
                          // report code
                          Container(
                            height: MediaQuery.of(context).size.height / 18,
                            decoration: BoxDecoration(
                                color: lightPrimaryColor.withOpacity(0.1),
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
                            padding: const EdgeInsets.only(right: 5),
                            child: Row(
                              children: [
                                const CircleAvatar(
                                  radius: 7,
                                  backgroundColor: lightPrimaryColor,
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                const AutoSizeText(
                                  "كود البلاغ : ",
                                  style: TextStyle(
                                      color: primaryColor,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                                AutoSizeText(
                                  code,
                                  style: const TextStyle(
                                      color: blackColor, fontSize: 8),
                                )
                              ],
                            ),
                          ),
                          // report Status
                          Container(
                            height: MediaQuery.of(context).size.height / 18,
                            decoration: BoxDecoration(
                                color: lightPrimaryColor.withOpacity(0.1),
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
                            padding: const EdgeInsets.only(right: 5),
                            child: Row(
                              children: [
                                const CircleAvatar(
                                  radius: 7,
                                  backgroundColor: lightPrimaryColor,
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                const AutoSizeText(
                                  "حالة البلاغ : ",
                                  style: TextStyle(
                                      color: primaryColor,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                                AutoSizeText(
                                  status,
                                  style: const TextStyle(
                                      color: blackColor, fontSize: 15),
                                )
                              ],
                            ),
                          ),
                          //report Images
                          Container(
                            height: MediaQuery.of(context).size.height / 6,
                            margin: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                //  color: lightPrimaryColor.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(10),
                                border:
                                    Border.all(width: 2, color: primaryColor)),
                            child: ListView.builder(
                                scrollDirection: Axis.vertical,
                                itemCount: photos.length,
                                itemBuilder: (context, index) {
                                  return Container(
                                    height:
                                        MediaQuery.of(context).size.height / 9,
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 15, vertical: 10),
                                    decoration: BoxDecoration(
                                        //   border: Border.all(width: 1,color: redColor),
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                '$imageUrl${photos[index]}'))),
                                  );
                                }),
                          )
                        ],
                      ),
                    ),
              status == "تحت المراجعه"
                  ? InkWell(
                      onTap: () {
                        CoolAlert.show(
                          confirmBtnText: "حسناً",
                          confirmBtnColor: primaryColor,
                          backgroundColor: lightPrimaryColor,
                          onConfirmBtnTap: () {
                            Navigator.pop(context);
                          },
                          context: context,
                          type: CoolAlertType.custom,
                          widget: Container(
                            alignment: Alignment.center,
                            height: MediaQuery.of(context).size.height / 10,
                            child: const AutoSizeText(
                              "تم إرسال الطلب  وسيتم حل المشكلة فى اقرب وقت ممكن ",
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
                        width: MediaQuery.of(context).size.width / 2,
                        height: MediaQuery.of(context).size.height / 15,
                        decoration: BoxDecoration(
                            color: lightPrimaryColor,
                            border: Border.all(width: 2, color: primaryColor),
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: const DecorationImage(
                                      image: AssetImage(
                                          "assets/icons/warning.png"),
                                      fit: BoxFit.cover)),
                            ),
                            const Text(
                              "إستعجال البلاغ ",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15),
                            )
                          ],
                        ),
                      ),
                    )
                  : InkWell(
                      onTap: () {
                        CoolAlert.show(
                            title: "هل تم حل المشكلة ؟ ",
                            confirmBtnText: "نعم",
                            cancelBtnText: "لا ",
                            cancelBtnTextStyle: const TextStyle(
                                color: primaryColor, fontSize: 16),
                            confirmBtnColor: primaryColor,
                            backgroundColor: lightPrimaryColor,
                            onConfirmBtnTap: () {
                              Navigator.pop(context);
                              Fluttertoast.showToast(
                                  msg: "شكراً لتواصلكم معنا ",
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
                                      "سيتم مراجعة البلاغ مرة اخري للتمكن من حل المشكلة ",
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
                        width: MediaQuery.of(context).size.width / 2,
                        height: MediaQuery.of(context).size.height / 15,
                        decoration: BoxDecoration(
                            color: lightPrimaryColor,
                            border: Border.all(width: 2, color: primaryColor),
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: const DecorationImage(
                                      image: AssetImage(
                                          "assets/icons/warning.png"),
                                      fit: BoxFit.cover)),
                            ),
                            const Text(
                              "هل تم حل المشكلة؟",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 13),
                            )
                          ],
                        ),
                      ),
                    )
            ],
          ),
        );
      })),
    );
  }
}


/*

 log("noticeClassifyId : $noticeClassifyId");
    log("text : $text");
    log("date : $date");
    log("lat : $lat");
    log("long : $long");
    log("noticeClassifyType : $noticeClassifyType");
    log("code : $code");
    log("status : $status");
    log("photos : $photos");

 */