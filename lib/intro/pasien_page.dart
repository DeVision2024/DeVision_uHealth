import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uhealth/screen/home_page.dart';

class PasienFormPage extends StatefulWidget {
  const PasienFormPage({super.key});

  @override
  State<PasienFormPage> createState() => PasienFormPageState();
}

class PasienFormPageState extends State<PasienFormPage> {
  @override
  Widget build(BuildContext context) {
    TextEditingController bb_controller_signup = TextEditingController();
    TextEditingController tb_controller_signup = TextEditingController();
    TextEditingController riwayat_controller_signup = TextEditingController();
    TextEditingController gender_controller_signup = TextEditingController();
    TextEditingController umur_controller_signup = TextEditingController();

    final emailUser = FirebaseAuth.instance.currentUser!.email.toString();
    CollectionReference current_user =
        FirebaseFirestore.instance.collection('users');

    Future tambahInfoData(String riwayat, String berat, String tinggi,
        String jenis, String umur, String userEmail) async {
      try {
        final data = {
          'riwayat': riwayat,
          'berat': berat,
          'tinggi': tinggi,
          'jenis': jenis,
          'umur': umur,
        };

        await FirebaseFirestore.instance
            .collection('users')
            .doc(userEmail)
            .update(data);

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
                  'Data Berhasil Ditambahkan, \nAnda akan segera diarahkan ke Home Page',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.inter(
                      fontSize: 15,
                      color: Colors.white,
                      fontWeight: FontWeight.w500),
                ),
              ),
            )));

        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const HomePage()));
      } on FirebaseAuthException catch (e) {}
    }

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
              Text('Mohon Lengkapi Data',
                  style: GoogleFonts.inter(
                      fontSize: 24,
                      color: Colors.white,
                      fontWeight: FontWeight.w600)),
              const SizedBox(height: 30),

              //! RIWAYAT FIELD !//
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white),
                child: TextFormField(
                  controller: riwayat_controller_signup,
                  textInputAction: TextInputAction.next,
                  onTapOutside: (event) {
                    FocusManager.instance.primaryFocus?.unfocus();
                  },
                  onEditingComplete: () {
                    FocusManager.instance.primaryFocus?.unfocus();
                  },
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Riwayat Penyakit',
                      hintStyle: GoogleFonts.poppins(
                          fontSize: 17,
                          color: Colors.grey[600],
                          fontWeight: FontWeight.w400)),
                ),
              ),

              //! BERAT FIELD !//
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white),
                child: TextFormField(
                  controller: bb_controller_signup,
                  textInputAction: TextInputAction.next,
                  onTapOutside: (event) {
                    FocusManager.instance.primaryFocus?.unfocus();
                  },
                  onEditingComplete: () {
                    FocusManager.instance.primaryFocus?.unfocus();
                  },
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Berat Badan',
                      hintStyle: GoogleFonts.poppins(
                          fontSize: 17,
                          color: Colors.grey[600],
                          fontWeight: FontWeight.w400)),
                ),
              ),

              //! TINGGI FIELD !//
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white),
                child: TextFormField(
                  controller: tb_controller_signup,
                  textInputAction: TextInputAction.next,
                  onTapOutside: (event) {
                    FocusManager.instance.primaryFocus?.unfocus();
                  },
                  onEditingComplete: () {
                    FocusManager.instance.primaryFocus?.unfocus();
                  },
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Tinggi Badan',
                      hintStyle: GoogleFonts.poppins(
                          fontSize: 17,
                          color: Colors.grey[600],
                          fontWeight: FontWeight.w400)),
                ),
              ),

              //! GENDER FIELD !//
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white),
                child: TextFormField(
                  controller: gender_controller_signup,
                  textInputAction: TextInputAction.next,
                  onTapOutside: (event) {
                    FocusManager.instance.primaryFocus?.unfocus();
                  },
                  onEditingComplete: () {
                    FocusManager.instance.primaryFocus?.unfocus();
                  },
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Jenis Kelamin',
                      hintStyle: GoogleFonts.poppins(
                          fontSize: 17,
                          color: Colors.grey[600],
                          fontWeight: FontWeight.w400)),
                ),
              ),

              //! GENDER FIELD !//
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white),
                child: TextFormField(
                  controller: umur_controller_signup,
                  textInputAction: TextInputAction.next,
                  onTapOutside: (event) {
                    FocusManager.instance.primaryFocus?.unfocus();
                  },
                  onEditingComplete: () {
                    FocusManager.instance.primaryFocus?.unfocus();
                  },
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Umur',
                      hintStyle: GoogleFonts.poppins(
                          fontSize: 17,
                          color: Colors.grey[600],
                          fontWeight: FontWeight.w400)),
                ),
              ),

              //! BUTTON REGISTER !//
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  tambahInfoData(
                      riwayat_controller_signup.text,
                      bb_controller_signup.text,
                      tb_controller_signup.text,
                      gender_controller_signup.text,
                      umur_controller_signup.text,
                      emailUser);
                },
                style: ButtonStyle(
                    backgroundColor: MaterialStateColor.resolveWith(
                        (states) => const Color(0xff9eb38433)),
                    minimumSize: MaterialStateProperty.all(const Size(333, 42)),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)))),
                child: Text(
                  'Simpan Data',
                  style: GoogleFonts.inter(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
