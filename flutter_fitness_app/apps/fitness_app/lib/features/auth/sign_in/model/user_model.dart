/// User model class that contains the user's information
/// [userID] is the user's id
/// [email] is the user's email
/// [password] is the user's password
/// [name] is the user's name
/// [weight] is the user's weight
/// [height] is the user's height
/// [age] is the user's age
/// [favoriteID] is the user's favorite id
class User {
  User({
    this.userID,
    this.email,
    this.password,
    this.name,
    this.weight,
    this.weightGoal,
    this.height,
    this.age,
    this.favoriteID,
    this.levelID,
    this.goalID,
    this.avatar,
  });
  int? userID;
  String? email;
  String? password;
  String? name;
  double? weight;
  double? weightGoal;
  double? height;
  int? age;
  int? favoriteID;
  int? levelID;
  int? goalID;
  String? avatar;

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      userID: json['userID'] as int?,
      email: json['email'] as String?,
      password: json['password'] as String?,
      name: json['name'] as String?,
      weight: json['weight'] as double?,
      weightGoal: json['weightGoal'] as double?,
      height: json['height'] as double?,
      age: json['age'] as int?,
      favoriteID: json['favoriteID'] as int?,
      levelID: json['levelID'] as int?,
      goalID: json['goalID'] as int?,
      avatar: json['avatar'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      if (userID != null) 'userID': userID,
      'email': email,
      'password': password,
      'name': name,
      'weight': weight,
      'weightGoal': weightGoal,
      'height': height,
      'age': age,
      'favoriteID': favoriteID,
      'levelID': levelID,
      'goalID': goalID,
      'avatar': avatar,
    };
  }
}

User userStarted = User();
