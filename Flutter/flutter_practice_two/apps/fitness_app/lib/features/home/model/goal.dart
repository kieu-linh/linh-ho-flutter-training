/// class Goal contains the data for a goal
/// [goalID] is the goal's id
/// [name] is the goal's name
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
