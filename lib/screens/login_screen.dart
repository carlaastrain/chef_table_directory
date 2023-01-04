import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:my_app/widgets/sign_up_option.dart';

import '../utils/app_layout.dart';
import '../utils/app_styles.dart';
import '../widgets/login_screen_text.dart';
import '../widgets/login_screen_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                width: 220,
                color: Colors.black.withOpacity(0.3),
              ),
              const Gap(60),
              SizedBox(
                height: 50,
                child: LogInScreenTextField(
                  text: 'Enter username',
                  icon: Icons.person_outline,
                  isPasswordType: false,
                  controller: _emailController,
                ),
              ),
              const Gap(20),
              SizedBox(
                height: 50,
                child: LogInScreenTextField(
                  text: 'Enter password',
                  icon: Icons.lock_outline,
                  isPasswordType: true,
                  controller: _emailController,
                ),
              ),
              const Gap(20),
              SizedBox(
                child: LogInScreenButton(
                  isLogin: false,
                  onTap: () => {},
                ),
              ),
              const Gap(20),
              const SignUpOption()
            ]),
          ),
        ),
      ),
    );
  }
}