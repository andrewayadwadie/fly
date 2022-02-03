import 'dart:convert';

import 'package:fly/core/db/auth_shared_preferences.dart';
import 'package:fly/utils/constants.dart';
import 'package:http/http.dart' as http;

class ReminderServices {
  static Future postReminder({
    required int id,
  }) async {
    var url = "${apiUrl}NoticesReminders/AddNoticeReminder/$id";

    try {
      var res = await http.post(Uri.parse(url), headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${TokenPref.getTokenValue()}',
   
      });

      if (res.statusCode == 200 || res.statusCode == 201) {
        return "ok";
      }
    } catch (e) {
      throw "exception is : $e";
    }
  }
   static Future postReminderWithConfirm({
    required int id,
  }) async {
    var url = "${apiUrl}NoticesReminders/AddNoticeReminder/$id";

    try {
      var res = await http.post(Uri.parse(url), headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${TokenPref.getTokenValue()}',
   
      },
      body: jsonEncode({
        "confirm":"1"
      })
      );

      if (res.statusCode == 200 || res.statusCode == 201) {
        return 200;
      }else if(res.statusCode == 400){
        return 400;
      }
      else if(res.statusCode == 401){
        return 401;
      }
    } catch (e) {
      throw "exception is : $e";
    }
  }
}
