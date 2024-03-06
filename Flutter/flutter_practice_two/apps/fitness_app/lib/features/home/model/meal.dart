class Meal {
  Meal({
    this.mealID,
    this.description,
    this.imagePath,
    this.kcal,
  });
  int? mealID;
  String? imagePath;
  String? description;
  int? kcal;

  factory Meal.fromJson(Map<String, dynamic> json) {
    return Meal(
      mealID: json['mealID'] as int?,
      description: json['description'] as String?,
      imagePath: json['image'] as String?,
      kcal: json['kcal'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'mealID': mealID,
      'description': description,
      'image': imagePath,
      'kcal': kcal,
    };
  }
}
