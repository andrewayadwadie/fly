import 'dart:convert' as convert;
import 'dart:developer';
import 'dart:io';
import 'package:http/http.dart' as http;
// ignore: implementation_imports
import 'package:async/src/delegate/stream.dart';
import 'package:path/path.dart';

String baseUrl = "https://qualityapi.afaqci.com/api/Notices/";

class ReportServices {
  final Uri regUrl = Uri.parse('${baseUrl}AddNotice');
  Future sendFormData(
      {required noticeClassifyId,
      required text,
      required phone,
      required File imge,
      required lat,
      required long}) async {
    // ignore: deprecated_member_use
    var stream = http.ByteStream(DelegatingStream.typed(imge.openRead()));
    var length = await imge.length();

    var request = http.MultipartRequest("POST", regUrl);
    var multipartFile = http.MultipartFile('Photos', stream, length,
        filename: basename(imge.path));
    //contentType: new MediaType('image', 'png'));

    request.files.add(multipartFile);
    request.fields["Text"] = text;
    request.fields["NoticeClassifyId"] = noticeClassifyId;
    request.fields["Lat"] = lat;
    request.fields["Long"] = long;
    request.fields["Phone"] = phone;

    var response = await request.send();
    log("response Status ${response.statusCode}");
    log("text : $text");
    log("lat : $lat");
    log("long : $long");
    log("phone : $phone");
    log("imge : ${imge.path}");
    log("noticeClassifyId : $noticeClassifyId");
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
}
