import 'package:fly/core/service/orders_services.dart';
import 'package:get/get.dart';

class OrdersController extends GetxController {

  List<dynamic> oredersByPhone = [].obs;
  final RxBool _loading = true.obs;

  @override
  void onInit() {
    getOrdersData();
    super.onInit();
  }

  bool get loading => _loading.value;
  List<dynamic> getOrdersData( ) {
    if (_loading.value == true) {
      OrdersServices.getOrdersByPhone().then((value) {
        oredersByPhone = value;
        _loading.value = false;
        update();
      });
    }
    return oredersByPhone;
  }
}
