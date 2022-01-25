import 'package:fly/core/service/orders_services.dart';
import 'package:get/get.dart';

class OrdersController extends GetxController {
  final int phone;

  OrdersController(this.phone);
  List<dynamic> oredersByPhone = [].obs;
  final RxBool _loading = true.obs;

  @override
  void onInit() {
    getOrdersData(phone);
    super.onInit();
  }

  bool get loading => _loading.value;
  List<dynamic> getOrdersData(int phone) {
    if (_loading.value == true) {
      OrdersServices.getOrdersByPhone(phone).then((value) {
        oredersByPhone = value;
        _loading.value = false;
        update();
      });
    }
    return oredersByPhone;
  }
}
