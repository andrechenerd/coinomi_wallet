import 'package:coinomi/core/constanats/app_colors.dart';
import 'package:coinomi/core/extensions/widget_extensions.dart';
import 'package:flutter/material.dart';


class AppButton extends StatelessWidget {
  const AppButton({
    Key? key,
    required this.text,
    required this.onTap,
    this.horizontalMargin = 20,
    this.bgColor = AppColors.green,
    this.textColor = AppColors.white,
  }) : super(key: key);
  final String text;
  final VoidCallback onTap;
  final double horizontalMargin;
  final Color? bgColor;
  final Color? textColor;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.maxFinite,
        height: 51,
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(4),
        ),
        alignment: Alignment.center,
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 14, fontWeight: FontWeight.w700, color: textColor),
        ),
      ),
    ).symmetricPadding(horizontal: horizontalMargin);
  }
}
