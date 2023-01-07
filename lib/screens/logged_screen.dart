import 'package:flutter/material.dart';

import '../utils/app_styles.dart';
import '../widgets/build_cover.dart';

class LoggedScreen extends StatefulWidget {
  const LoggedScreen({super.key});

  @override
  State<LoggedScreen> createState() => _LoggedScreenState();
}

class _LoggedScreenState extends State<LoggedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      padding: EdgeInsets.zero,
      children: [
        Container(
            padding: const EdgeInsets.only(bottom: 90),
            child: const BuildCover()),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(width: 1.0, color: Colors.grey.shade500),
                ),
              ),
              child: Text(
                "You are logged!",
                style:
                    Styles.headlineStyle1.copyWith(color: Colors.grey.shade500),
              ),
            ),
          ],
        ),
      ],
    ));
  }
}
