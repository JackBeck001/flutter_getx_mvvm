import 'dart:async';

import 'package:flutter_getx_mvvm/res/routes/routes_name.dart';
import 'package:flutter_getx_mvvm/viewModels/controller/user_prefrences/user_prefrences_view_model.dart';
import 'package:get/get.dart';

class SplashService {
  UserPreferences userPreferences = UserPreferences();
  void isLogin() {
    userPreferences.getUser().then(
      (value) {
        if (value.token == null || value.token == "null") {
          Timer(
            const Duration(seconds: 3),
            () {
              Get.toNamed(RoutesName.loginView);
            },
          );
        } else {
          Timer(
            const Duration(seconds: 3),
            () {
              Get.toNamed(RoutesName.homeView);
            },
          );
        }
      },
    );
  }
}
