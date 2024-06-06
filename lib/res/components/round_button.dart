import 'package:flutter/material.dart';
import 'package:flutter_getx_mvvm/res/colors/app_colors.dart';

class RoundedButton extends StatelessWidget {
  final bool loading;
  final String title;
  final double height, width;
  final VoidCallback onPress;
  final Color textColor, buttonColors;

  const RoundedButton({
    super.key,
    this.buttonColors = AppColors.purpleColor,
    this.textColor = AppColors.whiteColor,
    required this.title,
    required this.onPress,
    this.width = 60,
    this.height = 50,
    this.loading = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
            color: buttonColors, borderRadius: BorderRadius.circular(50)),
        child: loading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Center(
                child: Text(
                  title,
                  style: TextStyle(color: textColor),
                ),
              ),
      ),
    );
  }
}
