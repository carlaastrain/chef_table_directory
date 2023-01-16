import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../utils/app_styles.dart';

class DetailsRow extends StatelessWidget {
  final Icon icon;
  final String stringText;
  const DetailsRow({
    super.key,
    required this.icon,
    required this.stringText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        children: [
          icon,
          const Gap(10),
          Flexible(
            child: Text(
              overflow: TextOverflow.ellipsis,
              stringText,
              style: Styles.textStyle.copyWith(
                fontSize: 12,
                color: Colors.grey.withOpacity(0.9),
              ),
              textAlign: TextAlign.start,
            ),
          ),
        ],
      ),
    );
  }
}
