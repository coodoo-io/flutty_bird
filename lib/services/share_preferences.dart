import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  Future<int> getScore() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt("score");
  }

  Future<bool> setScore(int value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setInt("score", value);
  }
}
