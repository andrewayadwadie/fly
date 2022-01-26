class ReportTypeModel {
  final int id;
  final String type;

  ReportTypeModel({required this.id, required this.type});

  factory ReportTypeModel.fromJson(Map<String, dynamic> jsonData) {
    return ReportTypeModel(
      id: jsonData['id'],
      type: jsonData['type'],
    );
  }
}
