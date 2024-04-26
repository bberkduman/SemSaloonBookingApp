// ignore_for_file: unused_local_variable

import 'package:shared_preferences/shared_preferences.dart';

class AppStorage{
  //hepsini oku
  Future<Map<String, dynamic>> readAll() async {
    final SharedPreferences storage = await SharedPreferences.getInstance();
    var language = storage.getString("language");
    var darkMode = storage.getBool("darkMode");

    return {
      "language": language,
      "darkMode": darkMode,
    };
  }

  //uygulama ayarlarını oku
  readAppSettings() async {
    final SharedPreferences storage = await SharedPreferences.getInstance();

    //dil seçti mi seçmedi mi
    var language = storage.getString("language");

    //gece moduna girdi mi girmedi mi
    var darkMode = storage.getBool("darkMode");

    return {
      "language": language,
      "darkMode": darkMode,
    };
  }

  //uygulama ayarlarını yaz
  writeAppSettings(
    {required String language,
    required bool darkMode,}
  ) async {
    final SharedPreferences storage = await SharedPreferences.getInstance();
    storage.setString("language", language);
    storage.setBool("darkMode", darkMode);
  }
}