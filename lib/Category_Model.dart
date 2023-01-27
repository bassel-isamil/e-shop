//model
// ignore_for_file: unnecessary_this

class CategoryModel {
  late int id;
  late String Avatar;
  late String Name;

  CategoryModel.fromJson(Map<String, dynamic> categoryMap) {
    this.id = categoryMap['id'];
    this.Name = categoryMap['name'];
    this.Avatar = categoryMap['avatar'];
  }
}
