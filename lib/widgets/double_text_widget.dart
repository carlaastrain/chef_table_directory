import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../utils/app_styles.dart';

class AppDoubleTextWidget extends StatelessWidget {
  final String bigText;
  final String smallText;

  const AppDoubleTextWidget(
      {super.key, required this.bigText, required this.smallText});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(bigText, style: Styles.headlineStyle2),
        InkWell(
          onTap: () => context.go('/favorites'),
          child: Text(smallText,
              style: Styles.textStyle.copyWith(color: Styles.primaryColor)),
        )
      ],
    );
  }
}
