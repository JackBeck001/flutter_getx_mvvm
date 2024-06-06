import 'package:flutter/material.dart';
import 'package:flutter_getx_mvvm/res/colors/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class InternetExceptionWidget extends StatefulWidget {
  final VoidCallback? onPress;
  const InternetExceptionWidget({super.key, required this.onPress});

  @override
  State<InternetExceptionWidget> createState() =>
      _InternetExceptionWidgetState();
}

class _InternetExceptionWidgetState extends State<InternetExceptionWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(children: [
        Icon(
          Icons.cloud_off,
          color: AppColors.redColor,
          size: 40.w,
        ),
        10.verticalSpace,
        Text(
          "internet_exception".tr,
          textAlign: TextAlign.center,
        ),
        10.verticalSpace,
        ElevatedButton(
          onPressed: widget.onPress,
          style: const ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(AppColors.purpleColor),
          ),
          child: Text(
            "Retry".tr,
            style: const TextStyle(color: AppColors.whiteColor),
          ),
        )
      ]),
    );
  }
}
