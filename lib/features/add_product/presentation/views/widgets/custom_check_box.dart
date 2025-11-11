import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';

class CustomCheckBox extends StatelessWidget {
  const CustomCheckBox({
    super.key,
    required this.isChecked,
    required this.onChanged,
  });

  final bool isChecked;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onChanged(!isChecked);
      },
      child: AnimatedContainer(
        width: 24,
        height: 24,
        duration: Duration(milliseconds: 100),
        decoration: ShapeDecoration(
          color: isChecked ? AppColors.primaryColor : Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: BorderSide(
              width: 1.5,
              color: isChecked ? Colors.transparent : Color(0xFFDDDFDF),
            ),
          ),
        ),
        child: isChecked
            ? Icon(Icons.check, color: Colors.white, size: 22)
            : const SizedBox(),
      ),
    );
  }
}
