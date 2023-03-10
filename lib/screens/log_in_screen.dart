import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:my_app/widgets/sign_up_option.dart';

import '../utils/app_layout.dart';
import '../utils/app_styles.dart';
import '../widgets/login_sign_up_screen_text.dart';
import '../widgets/login_sign_up_screen_button.dart';
import '../services/auth_service.dart';
import '../widgets/login_with_google_or_apple.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final authService = GetIt.I<AuthService>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Styles.blueMarine,
        elevation: 0,
      ),
      body: Container(
        width: AppLayout.getSize(context).width,
        height: AppLayout.getSize(context).height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Styles.blueMarine,
              Styles.pink,
            ],
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
                20, MediaQuery.of(context).size.height * 0.05, 20, 0),
            child: Column(children: [
              Image(
                image:
                    const AssetImage('assets/images/foodie_signing_screen.png'),
                fit: BoxFit.fitWidth,
                width: 90,
                color: Colors.black.withOpacity(0.3),
              ),
              SizedBox(
                child: LogInWithGoogleOrApple(
                  isLoginScreen: false,
                  onTap: () async => {
                    await authService.logInWithGoogle(),
                    GoRouter.of(context).go('/home')
                  },
                  icon: Icons.account_circle,
                  textButton: 'Sign in with Google',
                ),
              ),
              SizedBox(
                child: LogInWithGoogleOrApple(
                  isLoginScreen: false,
                  onTap: () => {
                    authService.logInWithApple(),
                  },
                  icon: Icons.apple_outlined,
                  textButton: 'Sign in with Apple',
                ),
              ),
              Text(
                'or',
                style:
                    Styles.headlineStyle3.copyWith(color: Colors.grey.shade800),
              ),
              const Gap(20),
              SizedBox(
                height: 50,
                child: LogInSignUpScreenTextField(
                  text: 'Enter email',
                  icon: Icons.email_outlined,
                  isPasswordType: false,
                  controller: _emailController,
                ),
              ),
              const Gap(20),
              SizedBox(
                height: 50,
                child: LogInSignUpScreenTextField(
                  text: 'Enter password',
                  icon: Icons.lock_outline,
                  isPasswordType: true,
                  controller: _passwordController,
                ),
              ),
              const Gap(20),
              SizedBox(
                child: LogInSignUpScreenButton(
                  isLoginScreen: false,
                  onTap: () => {
                    authService.signUpWithUsernameAndEmailAndPassword(
                      _emailController.text,
                      _passwordController.text,
                      _usernameController.text,
                    ),
                    GoRouter.of(context).go('/home')
                  },
                ),
              ),
              const SignUpOption(),
              const Gap(20),
            ]),
          ),
        ),
      ),
    );
  }
}


///