import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:my_app/screens/tabs_screen.dart';

import '../utils/app_layout.dart';
import '../utils/app_styles.dart';
import '../widgets/login_sign_up_screen_text.dart';
import '../widgets/login_sign_up_screen_button.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'login_screen.dart';

class SigningUpScreen extends StatefulWidget {
  const SigningUpScreen({super.key});

  @override
  State<SigningUpScreen> createState() => _SigningUpScreenState();
}

class _SigningUpScreenState extends State<SigningUpScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

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
                    FirebaseAuth.instance
                        .createUserWithEmailAndPassword(
                            email: _emailController.text,
                            password: _passwordController.text)
                        .then(
                          (value) => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginScreen()),
                          ).onError((error, stackTrace) => throw Error()),
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
