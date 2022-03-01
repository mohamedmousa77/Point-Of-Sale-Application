import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/user_login_model.dart';

class UserController extends GetxController {
  UserLogin _currentUser = UserLogin.empty();
  UserLogin get currentUser => _currentUser;

  void setCurrentUser(UserLogin user) {
    _currentUser = user;
    _saveUserData(user.firstName, user.id, user.businessId);
    update();
  }

  Future<void> setBusinessIs(int id) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    _currentUser.setBusinessId(id);
    pref.setInt("business_id", id);
    update();
  }

  Future<void> _saveUserData(String name, int id, int businessId) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString("first_name", name);
    pref.setInt("id", id);
    pref.setInt("business_id", businessId);
  }
}
