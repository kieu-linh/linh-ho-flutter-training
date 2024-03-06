class Favorite {
  Favorite({
    this.imagePath = '',
    this.title = '',
  });

  String imagePath;
  String title;

  factory Favorite.fromJson(Map<String, dynamic> json) {
    return Favorite(
      imagePath: json['image'] ,
      title: json['title'] ,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'image': imagePath,
      'title': title,
    };
  }
}
