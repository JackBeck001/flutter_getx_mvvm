import 'package:flutter/material.dart';
import 'package:flutter_getx_mvvm/res/components/round_button.dart';
import 'package:flutter_getx_mvvm/utils/utils.dart';
import 'package:flutter_getx_mvvm/viewModels/controller/login/login_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final loginController = Get.put(LoginController());
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text('Login'.tr),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Form(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: loginController.emailController.value,
                    focusNode: loginController.emailFocusNode.value,
                    onEditingComplete: () {
                      Utils.fieldFocusChange(
                        context,
                        loginController.emailFocusNode.value,
                        loginController.passwordFocusNode.value,
                      );
                    },
                    validator: (value) {
                      if (value == "") {
                        return "* Required";
                      } else {
                        return null;
                      }
                    },
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                  10.verticalSpace,
                  TextFormField(
                    controller: loginController.passwordController.value,
                    focusNode: loginController.passwordFocusNode.value,
                    validator: (value) {
                      if (value == "") {
                        return "* Required";
                      } else {
                        return null;
                      }
                    },
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                  20.verticalSpace,
                  Obx(() {
                    return RoundedButton(
                        loading: loginController.loading.value,
                        title: "Login",
                        width: 200,
                        onPress: () {
                          if (_formKey.currentState!.validate()) {
                            loginController.loginApi();
                          }
                        });
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
