import 'package:flutter/cupertino.dart';
import 'package:fly/core/service/report_service.dart';
import 'package:get/get.dart';

class ReportTypeController extends GetxController {
  @override
  void onInit() {
    getOrderType();
    super.onInit();
  }

  List<dynamic> orderType = [].obs;
  final RxBool _loading = true.obs;

  String typeText = "إختر نوع البلاغ";

  int noticeClassifyId = 0;

  void onTapSelected(BuildContext con, int id) {
    noticeClassifyId = id;
    Navigator.pop(con);

    typeText = orderType[id - 1].type;

    update();
  }

  bool get loading => _loading.value;
  List<dynamic> getOrderType() {
    if (_loading.value == true) {
      ReportServices.getReportType().then((value) {
        orderType = value;
        _loading.value = false;
        update();
      });
    }
    return orderType;
  }
}
