import 'package:coinomi/core/constanats/app_colors.dart';
import 'package:coinomi/core/extensions/widget_extensions.dart';
import 'package:flutter/material.dart';

class DialogButton extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  final bool isActive;
  const DialogButton({
    super.key,
    required this.onTap,
    required this.text,
    this.isActive = true,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        height: 38,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: isActive ? AppColors.ligthGrey : AppColors.darkGrey,
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 16,
            color: isActive ? AppColors.white : AppColors.ligthGrey,
          ),
        ).symmetricPadding(horizontal: 24),
      ),
    );
  }
}
