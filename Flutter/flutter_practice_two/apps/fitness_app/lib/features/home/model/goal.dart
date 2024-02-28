class Goal {
  Goal({
    this.goalID,
    this.name,
  });
  int? goalID;
  String? name;

  factory Goal.fromJson(Map<String, dynamic> json) {
    return Goal(
      goalID: json['goalID'] as int?,
      name: json['name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'goalID': goalID,
      'name': name,
    };
  }
}
