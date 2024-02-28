import 'package:coinomi/core/constanats/app_colors.dart';
import 'package:coinomi/core/extensions/widget_extensions.dart';
import 'package:flutter/material.dart';

class ButtonWithIcon extends StatelessWidget {
  final String imagePath;
  final String title;
  final VoidCallback onTap;
  final double iconHeight;
  final Color color;
  const ButtonWithIcon({
    super.key,
    required this.imagePath,
    required this.title,
    required this.onTap,
    this.color= Colors.transparent,
    this.iconHeight=24,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.fromLTRB(24, 14, 0, 15),
        height: 62,
        color:color,
        child: Row(
          children: [
            Image.asset(
              imagePath,
              height: iconHeight,
            ),
            Text(
              title,
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: AppColors.ligthGrey),
            ).onlyPadding(left: 10),
          ],
        ),
      ),
    );
  }
}
