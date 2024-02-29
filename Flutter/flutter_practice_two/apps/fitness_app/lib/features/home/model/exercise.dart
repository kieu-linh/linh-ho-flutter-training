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
    this.benefitID,
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
  int? benefitID;

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
      benefitID: json['benefitID'] as int?,
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
      'benefitID': benefitID,
    };
  }
}
