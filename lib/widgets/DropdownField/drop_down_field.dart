import 'package:flutter/material.dart';

import '../../services/utils/constants/constants.dart';

class DropDownField extends StatelessWidget {
  final String? value;
  final String hintText;
  final List<String> items;
  final ValueChanged<String?> onChanged;

  const DropDownField({
    super.key,
    required this.value,
    required this.hintText,
    required this.items,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[100]!),
        color: AppColors.textFiledColor,
        borderRadius: BorderRadius.circular(25),
      ),
      child: DropdownButtonFormField<String>(
        value: value,
        hint: Text(hintText,
            style: TextStyle(
                color: AppColors.textFiledHint,
                fontFamily: AppFontsFamily.spaceGrotesk,
                fontWeight: FontWeight.bold)),
        items: items
            .map((item) => DropdownMenuItem(
                  value: item,
                  child: Text(item,
                      style: TextStyle(
                          color: AppColors.textFiledHint,
                          fontFamily: AppFontsFamily.spaceGrotesk,
                          fontWeight: FontWeight.bold)),
                ))
            .toList(),
        onChanged: onChanged,
        decoration: const InputDecoration(
          border: InputBorder.none,
        ),
      ),
    );
  }
}
