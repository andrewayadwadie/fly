import 'dart:convert';
import 'dart:developer';

import 'package:fly/core/db/auth_shared_preferences.dart';
import 'package:fly/model/user_notices_model.dart';
import 'package:fly/utils/constants.dart';
import 'package:http/http.dart' as http;

class OrdersServices {
  static Future getOrdersByPhone() async {
    String url = "${apiUrl}Notices/GetUserNotices";

    http.Response res = await http.get(
      Uri.parse(url),
      headers: <String, String>{
          "Content-type": "application/json",
          'Accept': 'application/json',
          // 'Authorization': 'Bearer $token',
          'Authorization': 'Bearer ${TokenPref.getTokenValue()}',
        },
    );

    log("request res ${res.body}");
    if (res.statusCode == 200) {
      var jsonData = jsonDecode(res.body);
      log("message$jsonData");
      List oreders = jsonData.map((element) {
        return UserNoticesModel.fromJson(element);
      }).toList();

      return oreders;
    }
    else if(res.statusCode== 401){
      return 401;
    }else if (res.statusCode == 500 ||
        res.statusCode == 501 ||
        res.statusCode == 504 ||
        res.statusCode == 502) {
      return 500;
    }
    return 400;
  }
  

  //============================================================================
  //================== this function will not working now ======================
  //============================================================================
  static Future<dynamic> getOrdersByCode(String code) async {
    String url = "${apiUrl}Notices/GetUserNotice/$code";

    http.Response res = await http.get(
      Uri.parse(url),
       headers: <String, String>{
          "Content-type": "application/json",
          'Accept': 'application/json',
          'Authorization': 'Bearer ${TokenPref.getTokenValue()}',
        },
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
