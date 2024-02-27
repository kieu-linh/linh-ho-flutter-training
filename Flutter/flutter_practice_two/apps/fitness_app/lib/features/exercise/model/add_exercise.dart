import 'dart:ui';

class AddExerciseModel {
  AddExerciseModel({
    this.exerciseID,
    this.image,
    this.title,
    this.kcal,
    this.min,
    this.level,
    this.backgroundColor,
    this.category,
    this.backgroundImage,
    this.weight,
    this.description,
    this.weeks,
    this.exerciseNumber,
  });

  int? exerciseID;
  String? image;
  String? title;
  int? kcal;
  int? min;
  String? level;
  Color? backgroundColor;
  String? category;
  String? backgroundImage;
  String? weight;
  String? description;
  int? weeks;
  int? exerciseNumber;

  factory AddExerciseModel.fromJson(Map<String, dynamic> json) {
    return AddExerciseModel(
      exerciseID: json['exerciseID'] as int?,
      image: json['image'] as String?,
      title: json['title'] as String?,
      kcal: json['kcal'] as int?,
      min: json['min'] as int?,
      level: json['level'] as String?,
      backgroundColor: json['backgroundColor'] as Color?,
      category: json['category'] as String?,
      backgroundImage: json['backgroundImage'] as String?,
      weight: json['weight'] as String?,
      description: json['description'] as String?,
      weeks: json['weeks'] as int?,
      exerciseNumber: json['exerciseNumber'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'exerciseID': exerciseID,
      'image': image,
      'title': title,
      'kcal': kcal,
      'min': min,
      'level': level,
      'backgroundColor': backgroundColor,
      'category': category,
      'backgroundImage': backgroundImage,
      'weight': weight,
      'description': description,
      'weeks': weeks,
      'exerciseNumber': exerciseNumber,
    };
  }
}
