class Benefit {
  Benefit({
    this.benefitID,
    this.title,
  });
  int? benefitID;
  String? title;

  factory Benefit.fromJson(Map<String, dynamic> json) {
    return Benefit(
      benefitID: json['benefitID'] as int?,
      title: json['title'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'benefitID': benefitID,
      'title': title,
    };
  }
}
