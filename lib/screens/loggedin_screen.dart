import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../services/auth_service.dart';
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          AuthService().logOut();
        },
        backgroundColor: Colors.green,
        child: const Icon(Icons.logout_rounded),
      ),
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            padding: const EdgeInsets.only(bottom: 90),
            child: GestureDetector(
              onTap: () {
                AuthService().logOut();
              },
              child: const BuildCover(),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Foodie ${FirebaseAuth.instance.currentUser?.displayName ?? 'User'}',
                style:
                    Styles.headlineStyle2.copyWith(color: Colors.grey.shade500),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
