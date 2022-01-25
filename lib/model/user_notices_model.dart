class UserNoticesModel {
  final int id;
  final int noticeClassifyId;
  final String text;
  final String date;
  final String lat;
  final String long;
  final String noticeClassifyType;
  final String code;
  final String phone;
  final String status;
  final List<dynamic> photos;

  UserNoticesModel(
      {required this.noticeClassifyId,
      required this.date,
      required this.lat,
      required this.long,
      required this.noticeClassifyType,
      required this.code,
      required this.phone,
      required this.status,
      required this.photos,
      required this.id,
      required this.text});

  factory UserNoticesModel.fromJson(Map<String, dynamic> jsonData) {
    return UserNoticesModel(
      id: jsonData['id'],
      text: jsonData['text'],
      code: jsonData['code'],
      date: jsonData['date'],
      lat: jsonData['lat'],
      long: jsonData['long'],
      noticeClassifyId: jsonData['noticeClassifyId'],
      noticeClassifyType: jsonData['noticeClassifyType'],
      phone: jsonData['phone'],
      photos: jsonData['photos'],
      status: jsonData['status'],
    );
  }
}
