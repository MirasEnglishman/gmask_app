import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String USER_ID = 'USER_ID';
const String ACCESS_TOKEN = 'ACCESS_TOKEN';
const String AUTH_PAIR = 'AUTH_PAIR';
const String FLAVOR = 'FLAVOR';


final sharedPreference = SharedPreferenceHelper();

@injectable
class SharedPreferenceHelper {
  late SharedPreferences storage;

  Future<void> init() async {
    storage = await SharedPreferences.getInstance();
  }

  Future<bool> setAccessToken(String value) {
    return storage.setString(ACCESS_TOKEN, value);
  }

  String get accessToken {
    return storage.getString(ACCESS_TOKEN) ?? '';
  }


  String get flavor {
    return storage.getString(FLAVOR) ?? '';
  }

  Future<bool> setAuthPair(String value) {
    return storage.setString(AUTH_PAIR, value);
  }

  String get authPair {
    return storage.getString(AUTH_PAIR) ?? '';
  }

  Future<bool> setFlavor(String value) {
    return storage.setString(FLAVOR, value);
  }

  Future<void> reload() async {
    return await storage.reload();
  }

  Future<void> clearTokens() async {
    await storage.remove(ACCESS_TOKEN);
    await storage.remove(AUTH_PAIR);
  }
}