import 'package:flutter_getx_mvvm/res/routes/routes_name.dart';
import 'package:flutter_getx_mvvm/view/home/home_view.dart';
import 'package:flutter_getx_mvvm/view/login/login_view.dart';
import 'package:flutter_getx_mvvm/view/splash_screen.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class AppRoutes {
  static appRoutes() => [
        GetPage(
          name: RoutesName.splashScreen,
          page: () => const SplashScreen(),
          transition: Transition.leftToRightWithFade,
          transitionDuration: const Duration(microseconds: 250),
        ),
        GetPage(
          name: RoutesName.loginView,
          page: () => const LoginView(),
          transition: Transition.leftToRightWithFade,
          transitionDuration: const Duration(microseconds: 250),
        ),
        GetPage(
          name: RoutesName.homeView,
          page: () => const HomeView(),
          transition: Transition.leftToRightWithFade,
          transitionDuration: const Duration(microseconds: 250),
        ),
      ];
}
