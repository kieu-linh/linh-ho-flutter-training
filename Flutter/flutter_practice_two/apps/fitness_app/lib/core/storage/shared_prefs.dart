import 'dart:convert';

import 'package:fitness_app/features/auth/login/model/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<void> saveAccount(User user) async {
    SharedPreferences prefs = await _prefs;
    Map<String, dynamic> map = user.toJson();
    await prefs.setString('user', jsonEncode(map));
  }

  Future<User?> getAccount() async {
    SharedPreferences prefs = await _prefs;
    String? data = prefs.getString('user');
    if (data == null) return null;
    final map = jsonDecode(data) as Map<String, dynamic>;
    return User.fromJson(map);
  }

  Future<void> deleteAccount() async {
    SharedPreferences prefs = await _prefs;
    await prefs.remove('user');
  }
}
