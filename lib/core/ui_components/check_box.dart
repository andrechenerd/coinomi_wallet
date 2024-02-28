import 'package:coinomi/core/constanats/app_colors.dart';
import 'package:flutter/material.dart';

class CheckboxWidget extends StatelessWidget {
  final VoidCallback onTap;
  final bool isChecked;
  const CheckboxWidget({
    super.key,
    required this.onTap,
    required this.isChecked,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        width: 24,
        height: 24,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          border: Border.all(
            color: AppColors.ligthGrey,
          ),
        ),
        child: isChecked
            ? const Icon(
                Icons.check_rounded,
                color: AppColors.green,
              )
            : const SizedBox(),
      ),
    );
  }
}
