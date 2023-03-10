import 'package:flutter/material.dart';
import 'package:my_app/utils/app_layout.dart';

import '../utils/app_styles.dart';

class LogInSignUpScreenButton extends StatelessWidget {
  final bool isLoginScreen;
  final Function onTap;

  const LogInSignUpScreenButton({
    super.key,
    required this.isLoginScreen,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppLayout.getSize(context).width,
      height: 50,
      margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          AppLayout.getHeight(90),
        ),
      ),
      child: ElevatedButton(
        onPressed: () => onTap(),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.pressed)) {
              return Styles.pink.withOpacity(0.3);
            }
            return Styles.blueMarine.withOpacity(0.5);
          }),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                AppLayout.getHeight(30),
              ),
            ),
          ),
        ),
        child: Text(
          isLoginScreen ? "SIGN UP" : "Log in with email",
          style: TextStyle(
            color: Colors.white.withOpacity(0.6),
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
