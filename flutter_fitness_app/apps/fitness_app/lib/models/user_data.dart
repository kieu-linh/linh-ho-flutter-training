class User {
  User({
    this.image = '',
    this.name = '',
    this.weight = 0,
    this.height = 0,
    this.age = 0,
  });

  String image;
  String name;
  double weight;
  double height;
  int age;

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      image: json['image'] as String,
      name: json['name'] as String,
      weight: json['weight'] as double,
      height: json['height'] as double,
      age: json['age'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'image': image,
      'name': name,
      'weight': weight,
      'height': height,
      'age': age,
    };
  }
}
