import 'dart:convert';

import 'package:fitness_app/features/auth/login/model/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  /// This code is called when the user signs in. It saves the user's account
  Future<void> saveAccount(User user) async {
    
    SharedPreferences prefs = await _prefs;
    Map<String, dynamic> map = user.toJson();

    await prefs.setString('user', jsonEncode(map));
  }

  /// This code is called when the user signs in. It gets the user's account
  Future<User?> getAccount() async {
    SharedPreferences prefs = await _prefs;
    String? data = prefs.getString('user');

    if (data == null) return null;

    final map = jsonDecode(data) as Map<String, dynamic>;

    return User.fromJson(map);
  }

  /// This code is called when the user signs out. It deletes the user's account
  Future<void> deleteAccount() async {
    SharedPreferences prefs = await _prefs;
    
    await prefs.remove('user');
  }
}
