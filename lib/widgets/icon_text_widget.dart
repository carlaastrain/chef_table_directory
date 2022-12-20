import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../utils/app_layout.dart';
import '../utils/app_styles.dart';

class AppIconText extends StatelessWidget {
  final String text;
  final IconData icon;
  const AppIconText({super.key, required this.text, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppLayout.getHeight(12),
        vertical: AppLayout.getWidth(12),
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            AppLayout.getWidth(10),
          ),
          color: Colors.white),
      child: Row(
        children: [
          Icon(icon, color: Styles.iconColor),
          Gap(AppLayout.getWidth(10)),
          Text(text, style: Styles.textStyle),
        ],
      ),
    );
  }
}
