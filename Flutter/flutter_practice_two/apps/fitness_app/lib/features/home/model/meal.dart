/// class Meal contains the data for a meal 
/// [mealID] is the meal's id
/// [description] is the meal's description
/// [imagePath] is the meal's image path
/// [kcal] is the meal's kcal
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
