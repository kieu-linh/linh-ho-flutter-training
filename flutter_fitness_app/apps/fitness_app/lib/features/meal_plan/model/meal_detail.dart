class MealDetail {
  MealDetail({
    this.mealDetailID,
    this.name,
  });
  int? mealDetailID;
  String? name;

  factory MealDetail.fromJson(Map<String, dynamic> json) {
    return MealDetail(
      mealDetailID: json['mealDetailID'] as int?,
      name: json['name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'mealDetailID': mealDetailID,
      'name': name,
    };
  }
}
