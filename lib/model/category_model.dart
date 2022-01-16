class CategoryModel {
  final int id;
  final String name;

  CategoryModel({required this.id, required this.name});

  factory CategoryModel.fromJson(Map<String, dynamic> jsonData) {
    return CategoryModel(
      id: jsonData['id'],
      name: jsonData['name'],
    );
  }
}
