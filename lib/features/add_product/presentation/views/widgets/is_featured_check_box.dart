import 'package:flutter/material.dart';

import '../../../../../core/utils/app_text_styles.dart';
import 'custom_check_box.dart';

class IsFeaturedCheckBox extends StatefulWidget {
  const IsFeaturedCheckBox({super.key, required this.onChanged});

  final ValueChanged<bool> onChanged;

  @override
  State<IsFeaturedCheckBox> createState() => _IsFeaturedCheckBoxState();
}

class _IsFeaturedCheckBoxState extends State<IsFeaturedCheckBox> {
  bool isFeaturedCheckBoxChecked = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: Row(
        children: [
          Text.rich(
            textAlign: TextAlign.start,
            TextSpan(
              children: [
                TextSpan(
                  text: 'Is Featured Product ?',
                  style: TextStyles.semiBold13.copyWith(
                    color: Color(0xFF949D9E),
                  ),
                ),
              ],
            ),
          ),
          Spacer(),
          CustomCheckBox(
            isChecked: isFeaturedCheckBoxChecked,
            onChanged: (bool value) {
              isFeaturedCheckBoxChecked = value;
              widget.onChanged(value);
              setState(() {});
            },
          ),
        ],
      ),
    );
  }
}
