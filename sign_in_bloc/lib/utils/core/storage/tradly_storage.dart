import 'package:shared_preferences/shared_preferences.dart';

class TradlyStorage {
  TradlyStorage({
    this.prefs,
  }) {
    init();
  }

  final SharedPreferences? prefs;

  late SharedPreferences _prefs;

  Future<void> init() async {
    _prefs = prefs ?? await SharedPreferences.getInstance();
  }

  Future<int> getInt(String key) async {
    return _prefs.getInt(key) ?? 0;
  }

  Future<bool> setInt(String key, int value) async {
    return _prefs.setInt(key, value);
  }

  Future<double> getDouble(String key) async {
    return _prefs.getDouble(key) ?? 0.0;
  }

  Future<bool> setDoublue(String key, double value) async {
    return _prefs.setDouble(key, value);
  }

  Future<bool> getBool(String key) async {
    return _prefs.getBool(key) ?? false;
  }

  Future<bool> setBool(String key, {bool value = false}) async {
    return _prefs.setBool(key, value);
  }

  Future<String> getString(String key) async {
    return _prefs.getString(key) ?? '';
  }

  Future<bool> setString(String key, String value) async {
    return _prefs.setString(key, value);
  }

  Future<List<String>> getStringList(String key) async {
    return _prefs.getStringList(key) ?? [];
  }

  Future<bool> setStringList(String key, List<String> value) async {
    return _prefs.setStringList(key, value);
  }

  Future<bool> containsKey(String key) async {
    return _prefs.containsKey(key);
  }

  Future<bool> removeData(String key) async {
    return _prefs.remove(key);
  }

  Future<bool> clearData() async {
    return _prefs.clear();
  }

  Future<Set<String>> getKeys() async {
    return _prefs.getKeys();
  }

  Future<void> reload() async {
    return _prefs.reload();
  }
}
