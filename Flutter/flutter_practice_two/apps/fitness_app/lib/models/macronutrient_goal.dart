class MacronutrientGoal {
  MacronutrientGoal({
    this.imagePath,
    this.title,
    this.gam,
    this.description,
  });

  String? imagePath;
  String? title;
  int? gam;
  String? description;

  factory MacronutrientGoal.fromJson(Map<String, dynamic> json) {
    return MacronutrientGoal(
      imagePath: json['image'] as String?,
      title: json['title'] as String?,
      gam: json['gam'] as int?,
      description: json['description'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'image': imagePath,
      'title': title,
      'gam': gam,
      'description': description,
    };
  }
}
