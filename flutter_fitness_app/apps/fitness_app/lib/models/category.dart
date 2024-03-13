class Category {
  Category({
    this.imagePath = '',
    this.name = '',
  });

  String imagePath;
  String name;

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      imagePath: json['image'] ,
      name: json['name'] ,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'image': imagePath,
      'name': name,
    };
  }
}
