import 'package:fly/core/service/orders_services.dart';
import 'package:get/get.dart';

class CodeOrdersController extends GetxController {
  final String code;

  CodeOrdersController(this.code);
  dynamic orederByCode;
  final RxBool _loading = true.obs;

  @override
  void onInit() {
    getOrdersByCode(code);
    super.onInit();
  }

  bool get loading => _loading.value;
  dynamic getOrdersByCode(String code) {
    if (_loading.value == true) {
      OrdersServices.getOrdersByCode(code).then((value) {
        orederByCode = value;
        _loading.value = false;
        update();
      });
    }
    return orederByCode;
  }
}
