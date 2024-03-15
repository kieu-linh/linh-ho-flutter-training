/// class Goal contains the data for a goal
/// [goalID] is the goal's id
/// [name] is the goal's name
/// [iconPath] is the goal's icon path
class Goal {
  Goal({
    this.goalID,
    this.name,
    this.iconPath,
  });
  int? goalID;
  String? name;
  String? iconPath;

  factory Goal.fromJson(Map<String, dynamic> json) {
    return Goal(
      goalID: json['goalID'] as int?,
      name: json['name'] as String?,
      iconPath: json['iconPath'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'goalID': goalID,
      'name': name,
      'iconPath': iconPath,
    };
  }
}
