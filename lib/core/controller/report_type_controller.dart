import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ReportTypeController extends GetxController {
  String typeText = "إختر نوع البلاغ";

  int noticeClassifyId = 0;

 void  onTapSelected(BuildContext con, int id) {
    noticeClassifyId = id;
    Navigator.pop(con);
    if(id == 1){
      typeText = "الإبلاغ عن منطقة حشرات";
    }else if(id == 2){
       typeText = "الإبلاغ عن منطقة حيوانات ضالة او ضارية";
    }else if(id == 3){
       typeText = "الإبلاغ عن منطقة تسريب أو تجمع مياه";
    }
    
    update();
  }
}
