class Category {
  Category({
    this.categoryID,
    this.name,
    this.image,
  });
  int? categoryID;
  String? image;
  String? name;

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      categoryID: json['categoryID'] as int?,
      name: json['name'] as String?,
      image: json['image'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'categoryID': categoryID,
      'name': name,
      'image': image,
    };
  }
}
