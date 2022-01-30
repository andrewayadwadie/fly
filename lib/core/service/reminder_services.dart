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
}
