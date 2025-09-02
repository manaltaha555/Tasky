import 'package:shared_preferences/shared_preferences.dart';

class Preferneces {
  static final Preferneces _instance = Preferneces._internal();

  Preferneces._internal();

  factory Preferneces() => _instance;

  late final SharedPreferences _prefs;

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  Future<void> saveString(String key, String value) async {
    await _prefs.setString(key, value);
  }

  String? getString(String key) {
    return _prefs.getString(key);
  }

  Future<void> clear() async {
    await _prefs.clear();
  }
}
