import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesManager {
  static SharedPreferencesManager? _instance;
  late SharedPreferences _prefs;

  static const String maxScoreKeyOneChance = 'maxScoreOneChance';
  static const String maxScoreKeyTimeAttack = 'maxScoreTimeAttack';

  SharedPreferencesManager._privateConstructor();

  static SharedPreferencesManager get instance {
    if (_instance == null) {
      _instance = SharedPreferencesManager._privateConstructor();
    }
    return _instance!;
  }

  Future<void> init() async {
    try {
      _prefs = await SharedPreferences.getInstance();
      _initPrefs();
    } catch (e) {
      print('SharedPreferences initialization failed: $e');
    }
  }

  Future<void> saveMaxScoreOneChance(int maxScore) async {
    await _prefs.setInt(maxScoreKeyOneChance, maxScore);
  }

  Future<void> saveMaxScoreTimeAttack(int maxScore) async {
    await _prefs.setInt(maxScoreKeyTimeAttack, maxScore);
  }

  int getMaxScoreOneChance() {
    return _prefs.getInt(maxScoreKeyOneChance) ?? 0;
  }

  int getMaxScoreTimeAttack() {
    return _prefs.getInt(maxScoreKeyTimeAttack) ?? 0;
  }

  void _initPrefs() {
    if (!_prefs.containsKey(maxScoreKeyOneChance) ||
        !_prefs.containsKey(maxScoreKeyTimeAttack)) {}
  }

  SharedPreferences get prefs => _prefs;
}
