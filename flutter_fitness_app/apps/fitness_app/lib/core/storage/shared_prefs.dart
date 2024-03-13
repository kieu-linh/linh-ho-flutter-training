import 'dart:convert';

import 'package:fitness_app/features/auth/sign_in/model/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
/// This class [SharedPrefs] is used to save, get and delete the user's account
class SharedPrefs {
  SharedPrefs(this.sharedPreferences);

  final Future<SharedPreferences> sharedPreferences;

  /// The function is called when the user signs in. It saves the user's account
  Future<void> saveAccount(User user) async {
    Map<String, dynamic> map = user.toJson();

    sharedPreferences.then((value) => value.setString('user', jsonEncode(map)));
  }

  /// This code is called when the user signs in. It gets the user's account
  Future<User?> getAccount() async {
    String? data = await sharedPreferences.then((value) => value.getString('user'));

    if (data == null) return null;

    final map = jsonDecode(data) as Map<String, dynamic>;

    return User.fromJson(map);
  }

  /// This code is called when the user signs out. It deletes the user's account
  Future<void> deleteAccount() async {
    await sharedPreferences.then((value) => value.remove('user'));
  }
}
