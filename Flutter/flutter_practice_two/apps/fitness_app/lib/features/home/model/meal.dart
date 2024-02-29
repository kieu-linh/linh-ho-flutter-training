class Meal {
  Meal({
    this.mealID,
    this.description,
    this.image,
    this.kcal,
  });
  int? mealID;
  String? image;
  String? description;
  int? kcal;

  factory Meal.fromJson(Map<String, dynamic> json) {
    return Meal(
      mealID: json['mealID'] as int?,
      description: json['description'] as String?,
      image: json['image'] as String?,
      kcal: json['kcal'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'mealID': mealID,
      'description': description,
      'image': image,
      'kcal': kcal,
    };
  }
}
