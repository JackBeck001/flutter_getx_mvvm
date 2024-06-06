import 'package:flutter_getx_mvvm/models/login/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  Future<bool> saveUser(UserModel model) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString('Token', model.token.toString());
    return true;
  }

  Future<UserModel> getUser() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    String? token = sp.getString('Token');
    return UserModel(token: token);
  }

  Future<bool> removeUser() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.clear();
    return true;
  }
}
