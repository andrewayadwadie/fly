import 'dart:convert';

import 'package:fly/utils/constants.dart';
import 'package:http/http.dart' as http;

class AuthServices {
  static Future register({
    required String name,
    required String phone,
    required String ssn,
    required String password,
  }) async {
    var url = "${apiUrl}Citizens/Register";

    try {
      var res = await http.post(Uri.parse(url),
          headers: {
            'Content-type': 'application/json',
            'Accept': 'application/json',
          },
          body: jsonEncode({
            {"Name": name, "Phone": phone, "SSN": ssn, "Password": password}
          }));

      if (res.statusCode == 200 || res.statusCode == 201) {
        var registerDataJson = jsonDecode(res.body)['data'];

        return [
          registerDataJson['token'], // 0 token
          registerDataJson['expiresOn'], // 1 expire date
          registerDataJson['userName'], // 2 username
          registerDataJson['phone'], // 3 phone
          registerDataJson['ssn'], //4 SSN
        ];
      }
      if (res.statusCode == 400) {
        var registerDataJson = jsonDecode(res.body)['data'];
  
        return registerDataJson['errors'][0][0];
      }
    } catch (e) {
      throw "exception is : $e";
    }
  }

  static Future login({
    required String ssn,
    required String password,
  }) async {
    var url = "${apiUrl}Citizens/Register";

    try {
      var res = await http.post(Uri.parse(url),
          headers: {
            'Content-type': 'application/json',
            'Accept': 'application/json',
          },
          body: jsonEncode({
            {"SSN": ssn, "Password": password}
          }));

      if (res.statusCode == 200 || res.statusCode == 201) {
        var registerDataJson = jsonDecode(res.body)['data'];

        return [
          registerDataJson['token'], // 0 token
          registerDataJson['expiresOn'], // 1 expire date
          registerDataJson['userName'], // 2 username
          registerDataJson['phone'], // 3 phone
          registerDataJson['ssn'], //4 SSN
        ];
      }
      if (res.statusCode == 400) {
        var registerDataJson = jsonDecode(res.body)['data'];

        return registerDataJson['errors'][0][0];
      }
    } catch (e) {
      throw "exception is : $e";
    }
  }
}
