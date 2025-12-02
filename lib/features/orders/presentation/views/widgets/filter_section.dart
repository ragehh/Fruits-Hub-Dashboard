import 'package:flutter/material.dart';

import '../../../../../core/utils/app_text_styles.dart';

class FilterSection extends StatelessWidget {
  const FilterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Row(
        children: [
          Text('Filter', style: TextStyles.regular22),
          Spacer(),
          Icon(Icons.filter_list),
        ],
      ),
    );
  }
}
