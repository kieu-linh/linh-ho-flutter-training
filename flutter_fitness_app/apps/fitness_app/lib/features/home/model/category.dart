/// class Category contains the data of a category
/// [categoryID] is the category's id
/// [name] is the category's name
/// [imagePath] is the category's image path
class Category {
  Category({
    this.categoryID,
    this.name,
    this.imagePath,
  });
  int? categoryID;
  String? imagePath;
  String? name;

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      categoryID: json['categoryID'] as int?,
      name: json['name'] as String?,
      imagePath: json['image'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'categoryID': categoryID,
      'name': name,
      'image': imagePath,
    };
  }
}
