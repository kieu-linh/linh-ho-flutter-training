/// class favorite contains the data of a Favorite
/// [favoriteID] is the favorite's id
/// [name] is the favorite's name
/// [imagePath] is the favorite's image path
class Favorite {
  Favorite({
    this.favoriteID,
    this.name,
    this.imagePath,
  });
  int? favoriteID;
  String? imagePath;
  String? name;

  factory Favorite.fromJson(Map<String, dynamic> json) {
    return Favorite(
      favoriteID: json['favoriteID'] as int?,
      name: json['name'] as String?,
      imagePath: json['imagePath'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'favoriteID': favoriteID,
      'name': name,
      'imagePath': imagePath,
    };
  }
}
