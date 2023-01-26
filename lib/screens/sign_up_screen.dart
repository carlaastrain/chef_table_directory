import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get_it/get_it.dart';
import 'package:my_app/widgets/sign_up_option.dart';

import '../services/auth_service.dart';
import '../utils/app_layout.dart';
import '../utils/app_styles.dart';
import '../widgets/login_sign_up_screen_text.dart';
import '../widgets/login_sign_up_screen_button.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
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
                20, MediaQuery.of(context).size.height * 0.15, 20, 0),
            child: Column(children: [
              Image(
                image:
                    const AssetImage('assets/images/foodie_signing_screen.png'),
                fit: BoxFit.fitWidth,
                width: 120,
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
                  isLoginScreen: true,
                  onTap: () => {
                    authService.logInWithEmailAndPassword(
                      _emailController.text,
                      _passwordController.text,
                    ),
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
