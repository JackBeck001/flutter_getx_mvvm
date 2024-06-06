import 'package:flutter/material.dart';
import 'package:flutter_getx_mvvm/data/repository/login_repository/login_repository.dart';
import 'package:flutter_getx_mvvm/models/login/user_model.dart';
import 'package:flutter_getx_mvvm/res/routes/routes_name.dart';
import 'package:flutter_getx_mvvm/utils/utils.dart';
import 'package:flutter_getx_mvvm/viewModels/controller/user_prefrences/user_prefrences_view_model.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final _loginRepo = loginRepository();
  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;

  final emailFocusNode = FocusNode().obs;
  final passwordFocusNode = FocusNode().obs;

  UserPreferences userPreferences = UserPreferences();

  RxBool loading = false.obs;

  void loginApi() {
    loading.value = true;
    Map data = {
      'email': emailController.value.text,
      'password': passwordController.value.text,
    };

    _loginRepo.loginApi(data).then((value) {
      loading.value = false;
      userPreferences.saveUser(UserModel.fromJson(value)).then((value) {
        Get.delete<LoginController>();
        Get.toNamed(RoutesName.homeView);
      }).onError((error, stackTrace) {});
      Utils.snackBar('Login', 'Login Successfully');
    }).onError((error, stackTrace) {
      loading.value = false;
      Utils.snackBar("Error", error.toString());
    });
  }
}
