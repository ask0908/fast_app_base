import 'package:shared_preferences/shared_preferences.dart';

class AppSharedPreference {
  AppSharedPreference._();

  late SharedPreferences _preferences;

  static AppSharedPreference instance = AppSharedPreference._();
  static const keyCount = "count";
  static const keyLaunchCount = "launchCount";

  static init() async {
    instance._preferences = await SharedPreferences.getInstance();
  }

  static void setCount(int count) {
    instance._preferences.setInt(keyCount, count);
  }

  static void setLaunchCount(int count) {
    instance._preferences.setInt(keyLaunchCount, count);
  }

  static int getCountOrZero() {
    return instance._preferences.getInt("count") ?? 0;
  }
}