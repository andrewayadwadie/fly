import 'package:fly/core/service/home_services.dart';
import 'package:get/get.dart';

class AllCatController extends GetxController {
  List<dynamic> cats = [];
  bool loading = true;
  @override
  void onInit() {
    if (loading) {
      HomeServices.getAllCategoryName().then((value) {
        cats = value;
        loading = false;
        update();
      });
    }

    super.onInit();
  }
}
