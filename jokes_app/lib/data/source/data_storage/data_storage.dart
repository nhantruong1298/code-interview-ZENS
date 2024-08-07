import 'package:shared_preferences/shared_preferences.dart';

class DataStorage {
  SharedPreferences? _sharedPreferences;

  DataStorage();

  Future<void> setStringList(String key, List<String> value) async {
    await _initSharedPreferences();
    await _sharedPreferences!.setStringList(key, value);
  }

  Future<List<String>> getStringList(String key) async {
    await _initSharedPreferences();
    return _sharedPreferences?.getStringList(key) ?? <String>[];
  }

  _initSharedPreferences() async {
    _sharedPreferences ??= await SharedPreferences.getInstance();
  }
}
