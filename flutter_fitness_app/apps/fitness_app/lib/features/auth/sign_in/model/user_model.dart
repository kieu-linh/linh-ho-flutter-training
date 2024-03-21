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
    this.gender,
  });

  int? userID;
  String? email;
  String? password;
  String? name;
  dynamic weight;
  dynamic weightGoal;
  dynamic height;
  int? age;
  int? favoriteID;
  int? levelID;
  int? goalID;
  String? avatar;
  bool? gender;

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      userID: json['userID'] as int?,
      email: json['email'] as String?,
      password: json['password'] as String?,
      name: json['name'] as String?,
      weight: json['weight'] as dynamic,
      weightGoal: json['weightGoal'] as dynamic,
      height: json['height'] as dynamic,
      age: json['age'] as int?,
      favoriteID: json['favoriteID'] as int?,
      levelID: json['levelID'] as int?,
      goalID: json['goalID'] as int?,
      avatar: json['avatar'] as String?,
      gender: json['gender'] as bool?,
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
      'gender': gender
    };
  }

  Map<String, dynamic> toJsonProfile() {
    return {
      'name': name,
      'weight': weight,
      'height': height,
      'age': age,
      'avatar': avatar,
      'gender': gender
    };
  }
}

User userStarted = User();
