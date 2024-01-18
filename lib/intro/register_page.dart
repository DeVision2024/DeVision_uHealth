import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uhealth/screen/home_page.dart';
import 'package:uhealth/intro/pasien_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // ******* VARIABLE DECLARATION ******* //
  int error_code = 0;
  String account_type = 'Pasien';
  String errorMessage = '';
  bool password_visible = true;
  double height_error_bar = 50;
  Color error_color = const Color(0xFF2A2F4F);
  FirebaseAuth signup_auth = FirebaseAuth.instance;
  TextEditingController email_controller_signup = TextEditingController();
  TextEditingController password_controller_signup = TextEditingController();
  TextEditingController username_controller_signup = TextEditingController();
  TextEditingController nama_controller_signup = TextEditingController();

  Timer? _navigationTimer;
  @override
  void dispose() {
    // TODO: implement dispose
    email_controller_signup.dispose();
    password_controller_signup.dispose();
    username_controller_signup.dispose();
    nama_controller_signup.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFF4F6F52),
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('assets/uhealth.png', scale: 1.5),
                const SizedBox(height: 30),
                Text('Daftar Akun',
                    style: GoogleFonts.inter(
                        fontSize: 24,
                        color: Colors.white,
                        fontWeight: FontWeight.w600)),
                const SizedBox(height: 30),

                //! NAMA LENGKAP FIELD !//
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white),
                  child: TextFormField(
                    controller: nama_controller_signup,
                    textInputAction: TextInputAction.next,
                    onTapOutside: (event) {
                      FocusManager.instance.primaryFocus?.unfocus();
                    },
                    onEditingComplete: () {
                      FocusManager.instance.primaryFocus?.unfocus();
                    },
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Nama Lengkap',
                        hintStyle: GoogleFonts.poppins(
                            fontSize: 17,
                            color: Colors.grey[600],
                            fontWeight: FontWeight.w400)),
                  ),
                ),

                //! USERNAME FIELD !//
                const SizedBox(height: 10),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white),
                  child: TextFormField(
                    controller: username_controller_signup,
                    textInputAction: TextInputAction.next,
                    onTapOutside: (event) {
                      FocusManager.instance.primaryFocus?.unfocus();
                    },
                    onEditingComplete: () {
                      FocusManager.instance.primaryFocus?.unfocus();
                    },
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Username',
                        hintStyle: GoogleFonts.poppins(
                            fontSize: 17,
                            color: Colors.grey[600],
                            fontWeight: FontWeight.w400)),
                  ),
                ),

                //! EMAIL FIELD !//
                const SizedBox(height: 10),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white),
                  child: TextFormField(
                    controller: email_controller_signup,
                    textInputAction: TextInputAction.next,
                    onTapOutside: (event) {
                      FocusManager.instance.primaryFocus?.unfocus();
                    },
                    onEditingComplete: () {
                      FocusManager.instance.primaryFocus?.unfocus();
                    },
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Email',
                        hintStyle: GoogleFonts.poppins(
                            fontSize: 17,
                            color: Colors.grey[600],
                            fontWeight: FontWeight.w400)),
                  ),
                ),

                //! PASSWORD FIELD !//
                const SizedBox(height: 10),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white),
                  child: TextFormField(
                    controller: password_controller_signup,
                    textInputAction: TextInputAction.done,
                    obscureText: password_visible,
                    onTapOutside: (event) {
                      FocusManager.instance.primaryFocus?.unfocus();
                    },
                    onEditingComplete: () {
                      FocusManager.instance.primaryFocus?.unfocus();
                    },
                    decoration: InputDecoration(
                        suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                password_visible = !password_visible;
                              });
                            },
                            icon: Icon(password_visible
                                ? Icons.visibility_off
                                : Icons.remove_red_eye)),
                        border: InputBorder.none,
                        hintText: 'Password',
                        hintStyle: GoogleFonts.poppins(
                            fontSize: 17,
                            color: Colors.grey[600],
                            fontWeight: FontWeight.w400)),
                  ),
                ),

                //! BUTTON ROW !//
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          setState(() {
                            account_type = 'Dokter';
                          });
                        },
                        style: ButtonStyle(
                            backgroundColor: MaterialStateColor.resolveWith(
                                (states) => const Color(0xff9eb38433)),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)))),
                        child: Text(
                          'Dokter',
                          style: GoogleFonts.inter(
                              color: Colors.white, fontWeight: FontWeight.w700),
                        )),
                    ElevatedButton(
                        onPressed: () {
                          setState(() {
                            account_type = 'Pasien';
                          });
                        },
                        style: ButtonStyle(
                            backgroundColor: MaterialStateColor.resolveWith(
                                (states) => const Color(0xff9eb38433)),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)))),
                        child: Text(
                          'Pasien',
                          style: GoogleFonts.inter(
                              color: Colors.white, fontWeight: FontWeight.w700),
                        )),
                    ElevatedButton(
                        onPressed: () {
                          setState(() {
                            account_type = 'Kurir';
                          });
                        },
                        style: ButtonStyle(
                            backgroundColor: MaterialStateColor.resolveWith(
                                (states) => const Color(0xff9eb38433)),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)))),
                        child: Text(
                          'Kurir',
                          style: GoogleFonts.inter(
                              color: Colors.white, fontWeight: FontWeight.w700),
                        )),
                  ],
                ),

                //! ACCOUNT TYPE !//
                const SizedBox(height: 15),
                Text(
                  'Tipe Akun : ' + account_type,
                  style: GoogleFonts.inter(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 16),
                ),

                //! BUTTON REGISTER !//
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    registerUser();
                  },
                  style: ButtonStyle(
                      backgroundColor: MaterialStateColor.resolveWith(
                          (states) => const Color(0xff9eb38433)),
                      minimumSize:
                          MaterialStateProperty.all(const Size(333, 42)),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)))),
                  child: Text(
                    'Register Now',
                    style: GoogleFonts.inter(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  //! ******* METHOD ADD ACCOUNT PROPERTIES ******* !//
  Future addAccount(String username_, String userEmail, String userPass,
      String namaLengkap, String tipeAkun) async {
    final data = {
      'username': username_,
      'email': userEmail,
      'password': userPass,
      'nama_lengkap': namaLengkap,
      'tipe_akun': tipeAkun,
    };

    await FirebaseFirestore.instance
        .collection('users')
        .doc(userEmail)
        .set(data);
  }

  //! ******* METHOD SIGN UP AUTHENTICATION ******* !//
  Future registerUser() async {
    //! CREATE USER
    try {
      final user_ = await signup_auth.createUserWithEmailAndPassword(
          email: email_controller_signup.text,
          password: password_controller_signup.text);

      await user_.user?.updateDisplayName(username_controller_signup.text);
      // await FirebaseAuth.instance.currentUser!.reload();
      FirebaseAuth.instance.currentUser!.displayName.toString();
      print({FirebaseAuth.instance.currentUser!.displayName});

      addAccount(
          username_controller_signup.text,
          email_controller_signup.text,
          password_controller_signup.text,
          nama_controller_signup.text,
          account_type);

      //! POP UP USER DIRECTLY GO TO DASHBOARD !//
      if (account_type == 'Pasien') {
        email_controller_signup.clear();
        password_controller_signup.clear();
        username_controller_signup.clear();
        nama_controller_signup.clear();
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            content: Padding(
              padding: const EdgeInsets.only(bottom: 80.0),
              child: Container(
                decoration: const BoxDecoration(
                    color: Color(0xFF02C62D),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                height: 50,
                width: 100,
                child: Text(
                  'Daftar berhasil, \nSelanjutnya adalah lengkapi data anda',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.inter(
                      fontSize: 15,
                      color: Colors.white,
                      fontWeight: FontWeight.w500),
                ),
              ),
            )));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            content: Padding(
              padding: const EdgeInsets.only(bottom: 80.0),
              child: Container(
                decoration: const BoxDecoration(
                    color: Color(0xFF02C62D),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                height: 50,
                width: 100,
                child: Text(
                  'Daftar berhasil, \nAnda akan diantar ke Halaman Utama',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.inter(
                      fontSize: 15,
                      color: Colors.white,
                      fontWeight: FontWeight.w500),
                ),
              ),
            )));
      }

      _navigationTimer = Timer(const Duration(milliseconds: 1000), () {
        if (mounted) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const HomePage()));
        }
      });
      // dispose();

      //! EXCEPTION TO CATCH EVERY ERROR !//
    } on FirebaseAuthException catch (e) {
      if (e.code.toString() == 'weak-password') {
        error_code = 1;
        height_error_bar = 60;
        error_color = const Color(0xFFFF0808);
        errorMessage = 'Password anda terlalu lemah';
      } else if (e.code.toString() == 'email-already-in-use') {
        error_code = 2;
        height_error_bar = 60;
        error_color = const Color(0xFF7707E9);
        errorMessage = 'Email telah terdaftar \nMohon gunakan email yang lain';
      } else if (e.code.toString() == 'invalid-email') {
        error_code = 3;
        height_error_bar = 60;
        error_color = const Color(0xFF0C134F);
        errorMessage = 'Email Tidak Valid \nMohon gunakan email yang valid';
      } else {
        error_color = const Color(0xFF02C62D);
        errorMessage = "Silahkan mengisi seluruh Form yang ada";
        print(e);
      }

      //! ERROR MESSAGE DISPLAY !//
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.transparent,
          elevation: 0,
          content: Padding(
            padding: const EdgeInsets.only(bottom: 300.0),
            child: Container(
              height: height_error_bar,
              width: 90,
              decoration: BoxDecoration(
                  color: error_color,
                  borderRadius: const BorderRadius.all(Radius.circular(10))),
              child: Center(
                child: Text(errorMessage,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Colors.white)),
              ),
            ),
          )));
    }
  }
}
