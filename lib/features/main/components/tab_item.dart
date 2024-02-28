import 'package:coinomi/core/constanats/app_colors.dart';
import 'package:coinomi/core/extensions/widget_extensions.dart';
import 'package:flutter/material.dart';

class TabItem extends StatelessWidget {
  final String imagePath;
  final String title;
  final bool isSelected;
  final VoidCallback onTap;
  const TabItem({
    super.key,
    required this.imagePath,
    required this.title,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.fromLTRB(24, 0, 0, 0),
        height: 62,
        color: isSelected ? AppColors.darkBlack : AppColors.transparent,
        child: Row(
          children: [
            Image.asset(
              imagePath,
              height: 30,
            ),
            Expanded(
              child: Text(
                title,
                overflow: TextOverflow.ellipsis,
                style: isSelected
                    ? const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: AppColors.white)
                    : const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: AppColors.ligthGrey),
              ).onlyPadding(left: 10),
            ),
            // const Spacer(),
            Container(
              height: 62,
              width: 7,
              color: isSelected ? AppColors.blue : AppColors.transparent,
            ),
          ],
        ),
      ),
    );
  }
}
