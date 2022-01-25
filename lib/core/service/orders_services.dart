import 'dart:convert';
import 'dart:developer';

import 'package:fly/model/user_notices_model.dart';
import 'package:fly/utils/constants.dart';
import 'package:http/http.dart' as http;

class OrdersServices {
  static Future<List<dynamic>> getOrdersByPhone(int phone) async {
    String url = "${apiUrl}Notices/GetUserNotices/0$phone";

    http.Response res = await http.get(
      Uri.parse(url),
    );
    log("phone is : $phone");
    log("request res ${res.body}");
    if (res.statusCode == 200) {
      var jsonData = jsonDecode(res.body);
      log("message$jsonData");
      List oreders = jsonData.map((element) {
        return UserNoticesModel.fromJson(element);
      }).toList();

      return oreders;
    }
    return [];
  }

  static Future<dynamic> getOrdersByCode(String code) async {
    String url = "${apiUrl}Notices/GetUserNotice/$code";

    http.Response res = await http.get(
      Uri.parse(url),
    );
    log("code is : $code");
    log("request res ${res.body}");
    if (res.statusCode == 200) {
      var jsonData = jsonDecode(res.body);
      log("message$jsonData");
      dynamic order = SingleUserNoticesModel.fromJson(jsonData);

      return order;
    } else if (res.statusCode == 400 || res.statusCode == 401) {
      var jsonData = jsonDecode(res.body)["errors"][0][0];
      log("message$jsonData");
      return jsonData;
    }
    return [];
  }
}
