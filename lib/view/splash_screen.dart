import 'package:flutter/material.dart';
import 'package:flutter_getx_mvvm/viewModels/services/splash_service.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashService _service = SplashService();

  @override
  void initState() {
    super.initState();
    _service.isLogin();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: Center(
        child: Text(
          'Welcome'.tr,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
