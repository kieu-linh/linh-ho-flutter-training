import 'dart:convert';

import 'package:fitness_app/pages/auth/login/model/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<void> saveAccount(UserModel user) async {
    SharedPreferences prefs = await _prefs;
    Map<String, dynamic> map = user.toJson();
    await prefs.setString('user', jsonEncode(map));
  }

  Future<UserModel?> getAccount() async {
    SharedPreferences prefs = await _prefs;
    String? data = prefs.getString('user');
    if (data == null) return null;
    final map = jsonDecode(data) as Map<String, dynamic>;
    return UserModel.fromJson(map);
  }

  Future<void> deleteAccount() async {
    SharedPreferences prefs = await _prefs;
    await prefs.remove('user');
  }
}
