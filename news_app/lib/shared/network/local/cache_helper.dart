import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper
{
  static SharedPreferences? sharedPrefrences;

  static init() async
  {
    sharedPrefrences = await SharedPreferences.getInstance();
  }

  static Future<bool> putBoolean({
    required String key,
    required bool value,
}) async
  {
    return await sharedPrefrences?.setBool(key, value) ?? false;
  }

  static bool getBoolean({
    required String key,
  })
  {
    return sharedPrefrences?.getBool(key) ?? false;
  }
}