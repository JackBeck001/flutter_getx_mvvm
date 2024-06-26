import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_getx_mvvm/res/getx_localization/Languages.dart';
import 'package:flutter_getx_mvvm/res/routes/routes.dart';
import 'package:flutter_getx_mvvm/res/routes/routes_name.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() {
  HttpOverrides.global = MyHttpOverrides();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      child: GetMaterialApp(
        translations: Languages(),
        fallbackLocale: const Locale('en', 'US'),
        locale: const Locale('en', 'US'),
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        initialRoute: RoutesName.splashScreen,
        getPages: AppRoutes.appRoutes(),
      ),
    );
  }
}
