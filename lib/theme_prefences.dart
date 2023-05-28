import 'package:shared_preferences/shared_preferences.dart';

class ThemePreference {
  static const _keyThemePreference = 'themePreference';

  static Future<void> setTheme(String themeName) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keyThemePreference, themeName);
  }

  static Future<String?> getTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_keyThemePreference);
  }
}
