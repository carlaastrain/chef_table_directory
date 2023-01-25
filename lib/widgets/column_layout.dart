import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:my_app/utils/app_layout.dart';

import '../utils/app_styles.dart';

class AppColumnLayout extends StatelessWidget {
  final String firstText;
  final String secondText;
  final String thirdText;
  final CrossAxisAlignment alignment;

  const AppColumnLayout(
      {super.key,
      required this.firstText,
      required this.secondText,
      required this.alignment,
      required this.thirdText});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: alignment,
      children: [
        Text(
          firstText,
          style: Styles.headlineStyle3,
        ),
        Gap(AppLayout.getHeight(5)),
        Text(
          secondText,
          style: Styles.headlineStyle4,
        ),
        Gap(AppLayout.getHeight(5)),
        Text(
          thirdText,
          style: Styles.headlineStyle4,
        ),
      ],
    );
  }
}
