import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import 'package:fly/utils/style.dart';
import 'package:fly/view/track_order/order_page_screen.dart';
import 'package:get/get.dart';

class SingleReportItemWidget extends StatelessWidget {
  const SingleReportItemWidget({
    Key? key,
  //  required this.phone,
    required this.id,
    required this.noticeClassifyType,
    required this.status,
    required this.date,
  }) : super(key: key);
  final int id;
 // final int phone;
  final String noticeClassifyType;
  final String status;
  final String date;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Get.to(()=>OrderPageScreen(
          //phone: phone,
          
          id:id));
      },
      child: Container(
        margin: const EdgeInsets.only(top: 10, right: 10, left: 10),
        height: MediaQuery.of(context).size.height / 13,
        decoration: const BoxDecoration(
            border: Border(
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
         
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AutoSizeText(
                  noticeClassifyType,
                  style: const TextStyle(
                      color: primaryColor,
                      fontSize: 13,
                      fontWeight: FontWeight.bold),
                ),
                 Text(
                  date.substring(0,10),
                  style:const TextStyle(
                      color: lightPrimaryColor,
                      fontSize: 12,
                      fontWeight: FontWeight.normal),
                ),
              ],
            ),
            Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width / 4.4,
              height: MediaQuery.of(context).size.height / 20,
              decoration: BoxDecoration(
                  color: status == "?????? ????????????????" ? redColor : lightPrimaryColor,
                  borderRadius: BorderRadius.circular(12)),
              child: AutoSizeText(
                
                status,
                maxLines: 2,
                style: const TextStyle(color: Colors.white),
              ),
            ),
       
          ],
        ),
      ),
    );
  }
}
