import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get_it/get_it.dart';
import 'package:my_app/utils/app_layout.dart';
import '../services/auth_service.dart';

import '../utils/app_styles.dart';

class LogInWithGoogle extends StatelessWidget {
  final authService = GetIt.I<AuthService>();
  final bool isLoginScreen;
  final Function onTap;

  LogInWithGoogle({
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
            return Styles.blueMarine.withOpacity(0.3);
          }),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                AppLayout.getHeight(30),
              ),
            ),
          ),
        ),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Image(
            image: AssetImage('assets/images/google_logo.png'),
            fit: BoxFit.fitWidth,
            width: 20,
          ),
          const Gap(10),
          Text(
            "Sign in with Google",
            style: TextStyle(
              color: Colors.white.withOpacity(0.6),
              fontSize: 20,
            ),
          ),
        ]),
      ),
    );
  }
}
