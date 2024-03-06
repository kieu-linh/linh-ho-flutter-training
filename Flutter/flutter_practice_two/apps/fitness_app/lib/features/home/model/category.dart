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
