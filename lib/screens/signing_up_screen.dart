import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

import '../utils/app_layout.dart';
import '../utils/app_styles.dart';
import '../widgets/login_sign_up_screen_text.dart';
import '../widgets/login_sign_up_screen_button.dart';
import '../services/auth_service.dart';

class SigningUpScreen extends StatefulWidget {
  const SigningUpScreen({super.key});

  @override
  State<SigningUpScreen> createState() => _SigningUpScreenState();
}

class _SigningUpScreenState extends State<SigningUpScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final authService = GetIt.I<AuthService>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign up'),
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
                width: 220,
                color: Colors.black.withOpacity(0.3),
              ),
              const Gap(60),
              SizedBox(
                height: 50,
                child: LogInSignUpScreenTextField(
                  text: 'Enter username',
                  icon: Icons.person_outline,
                  isPasswordType: false,
                  controller: _usernameController,
                ),
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
              const Gap(20),
            ]),
          ),
        ),
      ),
    );
  }
}


///