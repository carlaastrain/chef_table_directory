
import 'package:flutter/material.dart';

import '../utils/app_styles.dart';
import '../widgets/build_cover.dart';

class LoggedInScreen extends StatefulWidget {
  const LoggedInScreen({super.key});

  @override
  State<LoggedInScreen> createState() => _LoggedInScreenState();
}

class _LoggedInScreenState extends State<LoggedInScreen> {
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
                "You are logged in!",
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
