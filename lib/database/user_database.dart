import 'package:hive/hive.dart';

import '../data/models/user_model.dart';

class UserDB {
  static Future<void> saveUserData(UserModel userData) async {
    var userBox = await Hive.openBox<UserModel>('userBox');
    await userBox.put('user_key', userData);
    await userBox.close();
  }

  static Future<UserModel?> getUserData() async {
    var userBox = await Hive.openBox<UserModel>('userBox');
    var userData = userBox.get('user_key');
    await userBox.close();
    return userData;
  }

  static Future<void> deleteUserData() async {
    var userBox = await Hive.openBox<UserModel>('userBox');
    await userBox.clear();
    await userBox.close();
  }
}
