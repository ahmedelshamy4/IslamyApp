import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  SharedPrefs._();
  static late final SharedPreferences preferences;
  static Future<SharedPreferences> init() async =>
      preferences = await SharedPreferences.getInstance();
}
