import 'package:shared_preferences/shared_preferences.dart';

const authToken = 'auth_token';

class Store {
  late SharedPreferences store;

  Store._();

  static Store? _instance;

  static Store get sharedInstance => _instance ??= Store._();

  init() async {
    store = await SharedPreferences.getInstance();
  }

  //PUT
  static saveToken(String token) async {
    return Store.sharedInstance.store.setString(authToken, token);
  }

  //GET
  static getToken() async {
    return Store.sharedInstance.store.getString(authToken);
  }

  //DELETE
}
