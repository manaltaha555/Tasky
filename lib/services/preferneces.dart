import 'package:shared_preferences/shared_preferences.dart';

class Preferneces {
  static Preferneces _instance = Preferneces._init();

  Preferneces._init();

  factory Preferneces() => _instance;

  late final SharedPreferences _prefs;

  void init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  void saveString(String key, String value) async {
    await _prefs.setString(key, value);
  }

  String? getString(String key) {
    return _prefs.getString(key);
  }
}
