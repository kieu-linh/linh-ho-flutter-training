class Level {
  Level({this.levelID, this.name});

  int? levelID;
  String? name;

  factory Level.fromJson(Map<String, dynamic> json) {
    return Level(
      levelID: json['levelID'] as int?,
      name: json['name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'levelID': levelID,
      'name': name,
    };
  }
}
