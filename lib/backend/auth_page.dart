import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:uhealth/bottom_bar.dart';
import 'package:uhealth/screen/home_page.dart';
import 'package:uhealth/intro/login_page.dart';
import 'package:uhealth/intro/pasien_page.dart';

//! THIS CLASS WILL BE CHECK USER IF THEY HAVE BEEN SIGN IN OR NOT

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          //? User is Logged In
          if (snapshot.hasData) {
            return CustomBottomNavBar();
          }

          //? User is NOT Logged In
          else {
            return const LoginPage();
          }
        },
      ),
    );
  }
}
