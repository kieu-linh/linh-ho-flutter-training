/// class Exercise contains 1 abstract method and 1 constructor
/// [exerciseID] is the exercise's id
/// [image] is the exercise's image
/// [title] is the exercise's title
/// [kcal] is the exercise's kcal
/// [min] is the exercise's min
/// [level] is the exercise's level
/// [backgroundImage] is the exercise's background image
/// [weight] is the exercise's weight
/// [description] is the exercise's description
/// [weeks] is the exercise's weeks
/// [exerciseNumber] is the exercise's number
/// [type] is the exercise's type
/// [benefit] is the exercise's benefit

import 'package:fitness_app/features/exercise/model/benefit.dart';
class Exercise {
  Exercise({
    this.exerciseID,
    this.image,
    this.title,
    this.kcal,
    this.min,
    this.level,
    this.backgroundImage,
    this.weight,
    this.description,
    this.weeks,
    this.exerciseNumber,
    this.type,
    this.benefit,
  });
  int? exerciseID;
  String? image;
  String? title;
  int? kcal;
  int? min;
  String? level;
  String? backgroundImage;
  String? weight;
  String? description;
  int? weeks;
  int? exerciseNumber;
  int? type;

  Benefit? benefit;

  factory Exercise.fromJson(Map<String, dynamic> json) {
    return Exercise(
      exerciseID: json['exerciseID'] as int?,
      image: json['image'] as String?,
      title: json['title'] as String?,
      kcal: json['kcal'] as int?,
      min: json['min'] as int?,
      level: json['level'] as String?,
      backgroundImage: json['backgroundImage'] as String?,
      weight: json['weight'] as String?,
      description: json['description'] as String?,
      weeks: json['weeks'] as int?,
      exerciseNumber: json['exerciseNumber'] as int?,
      type: json['type'] as int?,
      benefit: json['Benefit'] != null
          ? Benefit.fromJson(json['Benefit'] as Map<String, dynamic>)
          : null,
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
      'backgroundImage': backgroundImage,
      'weight': weight,
      'description': description,
      'weeks': weeks,
      'exerciseNumber': exerciseNumber,
      'type': type,
      'benefit': benefit?.toJson(),
    };
  }
}
