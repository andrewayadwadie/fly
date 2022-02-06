import 'dart:convert' as convert;
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:fly/core/db/auth_shared_preferences.dart';
import 'package:fly/model/report_type_model.dart';
import 'package:fly/utils/constants.dart';
import 'package:http/http.dart' as http;
// ignore: implementation_imports
import 'package:async/src/delegate/stream.dart';
import 'package:path/path.dart';

String baseUrl = "${apiUrl}Notices/";

class ReportServices {
 
 static Future sendFormData(
      {required noticeClassifyId,
      required text,
      required phone,
      required File imge,
      required lat,
      required long,
      required name
      }) async {
         final Uri regUrl = Uri.parse('${baseUrl}AddNotice');
    // ignore: deprecated_member_use
    var stream = http.ByteStream(DelegatingStream.typed(imge.openRead()));
    var length = await imge.length();
    var headers =  <String, String>{
          "Content-type": "application/json",
          'Accept': 'application/json',
          'Authorization': 'Bearer ${TokenPref.getTokenValue()}',
        };

    var request = http.MultipartRequest("POST", regUrl);
   request.headers.addAll(headers);
    var multipartFile = http.MultipartFile('Photos', stream, length,
        filename: basename(imge.path));
    //contentType: new MediaType('image', 'png'));

    request.files.add(multipartFile);
  
    request.fields["Text"] = text;
    request.fields["NoticeClassifyId"] = noticeClassifyId;
    request.fields["Lat"] = lat;
    request.fields["Long"] = long;
    request.fields["Phone"] = phone;
    request.fields["Name"] = name;

    var response = await request.send();
/*
    log("response Status ${response.statusCode}");
    log("text : $text");
    log("lat : $lat");
    log("long : $long");
    log("phone : $phone");
    log("imge : ${imge.path}");
    log("noticeClassifyId : $noticeClassifyId");
    */
    if (response.statusCode == 400) {
      return 0;
    } else if (response.statusCode == 200 || response.statusCode == 201) {
      var res = 'default';
      await response.stream.transform(convert.utf8.decoder).listen((event) {
        res = event;
      }).asFuture();
      log("res======== $res");
      return convert.jsonDecode(res);
    }
  }

  static Future<dynamic> getReportType() async {
    String url = "${apiUrl}NoticeClassifies/GetAllNoticeClassifies";

    http.Response res = await http.get(
      Uri.parse(url),
       headers: <String, String>{
          "Content-type": "application/json",
          'Accept': 'application/json',
          'Authorization': 'Bearer ${TokenPref.getTokenValue()}',
        },
    );

    log("request res ${TokenPref.getTokenValue()}'");
    if (res.statusCode == 200) {
      var jsonData = jsonDecode(res.body);
      log("message$jsonData");
      dynamic type = jsonData.map((element) {
        return ReportTypeModel.fromJson(element);
      }).toList();

      return type;
    }
    return [];
  }
}
