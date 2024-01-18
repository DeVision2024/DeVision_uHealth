import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uhealth/screen/home_page.dart';
import 'package:uhealth/intro/register_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // ******* VARIABLE DECLARATION ******* //
  bool password_visible = true;
  TextEditingController login_email_controller = TextEditingController();
  TextEditingController login_password_controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFF4F6F52),
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            padding:
                const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/uhealth.png',
                  scale: 1.5,
                ),
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white),
                  child: TextFormField(
                      controller: login_email_controller,
                      textInputAction: TextInputAction.next,
                      style: GoogleFonts.inter(color: Colors.black),
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Email',
                          hintStyle: GoogleFonts.inter(
                              fontSize: 17,
                              color: Colors.grey[800],
                              fontWeight: FontWeight.w400))),
                ),
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white),
                  child: TextFormField(
                      obscureText: password_visible,
                      controller: login_password_controller,
                      textInputAction: TextInputAction.done,
                      style: GoogleFonts.inter(color: Colors.black),
                      decoration: InputDecoration(
                          suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  password_visible = !password_visible;
                                });
                              },
                              icon: Icon(password_visible
                                  ? Icons.remove_red_eye
                                  : Icons.visibility_off)),
                          border: InputBorder.none,
                          hintText: 'Password',
                          hintStyle: GoogleFonts.inter(
                              fontSize: 17,
                              color: Colors.grey[800],
                              fontWeight: FontWeight.w400))),
                ),
                const SizedBox(height: 50),
                ElevatedButton(
                  onPressed: () {
                    SignInUser();
                  },
                  style: ButtonStyle(
                      backgroundColor: MaterialStateColor.resolveWith(
                          (states) => const Color(0xff9eb38433)),
                      minimumSize:
                          MaterialStateProperty.all(const Size(333, 42)),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)))),
                  child: Text(
                    'Login',
                    style: GoogleFonts.inter(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                TextButton(
                    style: TextButton.styleFrom(
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap),
                    onPressed: () {},
                    child: Text(
                      'Forgot Password?',
                      style:
                          GoogleFonts.inter(fontSize: 15, color: Colors.white),
                    )),
                Row(
                  mainAxisAlignment:
                      MainAxisAlignment.center, //? WRAP ITEM VERTICAL
                  crossAxisAlignment:
                      CrossAxisAlignment.center, //? WRAP ITEM HORIZONTAL
                  children: [
                    const SizedBox(width: 10),
                    TextButton(
                      style: TextButton.styleFrom(
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const RegisterPage()));
                      },
                      child: Row(
                        children: [
                          Text('Don\'t have account? ',
                              style: GoogleFonts.poppins(
                                fontSize: 14,
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              )),
                          Text('Sign Up',
                              style: GoogleFonts.poppins(
                                fontSize: 14,
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                              )),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ));
  }

  void SignInUser() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: login_email_controller.text.trim(),
          password: login_password_controller.text.trim());

      // await FirebaseAuth.instance.currentUser!.reload();
      // await FirebaseAuth.instance.currentUser!.displayName.toString();

      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const HomePage()));
    } catch (e) {
      print('Error signing in: $e');
      // print('Email : ${FirebaseAuth.instance.currentUser!.email}');

      login_email_controller.text = '';
      login_password_controller.text = '';
      // Handle the error
    }
  }
}
