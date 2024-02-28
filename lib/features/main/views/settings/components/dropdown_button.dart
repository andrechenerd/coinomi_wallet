import 'package:coinomi/core/constanats/app_colors.dart';
import 'package:coinomi/core/constanats/app_icons.dart';
import 'package:coinomi/core/extensions/widget_extensions.dart';
import 'package:flutter/material.dart';

class DropdownBurronWidget extends StatefulWidget {
  final List<String> dropdownItems;
  const DropdownBurronWidget({super.key, required this.dropdownItems});

  @override
  State<DropdownBurronWidget> createState() => _DropdownBurronWidgetState();
}

class _DropdownBurronWidgetState extends State<DropdownBurronWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      height: 38,
      width: 200,
      decoration: BoxDecoration(
          color: AppColors.white, borderRadius: BorderRadius.circular(4)),
      child: DropdownButton(
        isExpanded: true,
        style: const TextStyle(fontSize: 16, color: AppColors.darkBlack),
        icon: Image.asset(
          AppIcons.arrowDown,
          width: 34,
        ),
        underline: const SizedBox(),
        dropdownColor: Colors.white,
        borderRadius: BorderRadius.circular(4),
        value: widget.dropdownItems.first,
        items: widget.dropdownItems.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        onChanged: (String? newValue) {
          setState(() {
            widget.dropdownItems.first = newValue!;
          });
        },
      ),
    ).onlyPadding(bottom: 24, left: 40);
  }
}
