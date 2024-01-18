import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uhealth/bottom_bar.dart';
import 'package:uhealth/screen/daily-prop/calendar_daily.dart';
import 'package:uhealth/screen/daily-prop/daily_cons.dart';
import 'package:uhealth/screen/daily-prop/health_rec.dart';
import 'package:uhealth/screen/daily-prop/medical_cond.dart';
import 'package:uhealth/screen/daily-prop/row_header.dart';

class DailyCheck extends StatelessWidget {
  const DailyCheck({super.key});

  @override
  Widget build(BuildContext context) {
    final now_email = FirebaseAuth.instance.currentUser!.email;

    return Scaffold(
        backgroundColor: Colors.white,
        body: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('users')
                .doc(now_email.toString())
                .snapshots(),
            builder: (context, snapshot) {
              Map? userData = snapshot.data?.data() as Map?;
              return SingleChildScrollView(
                child: Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.symmetric(
                        vertical: 50, horizontal: 20),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RowHeader(userData: userData),
                          const SizedBox(height: 45),
                          MedicalCondition(userData: userData),
                          const SizedBox(height: 25),
                          DailyConsumption(),
                          const SizedBox(height: 25),
                          CalendarDaily(),
                          const SizedBox(height: 25),
                          HealthRecord(),
                          const SizedBox(height: 25),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const CustomBottomNavBar()));
                            },
                            style: ButtonStyle(
                                backgroundColor: MaterialStateColor.resolveWith(
                                    (states) => const Color(0xFF9EB384)),
                                minimumSize: MaterialStateProperty.all(
                                    const Size(500, 42)),
                                shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)))),
                            child: Text(
                              'Kembali ke Home Page',
                              style: GoogleFonts.inter(
                                  fontSize: 16,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700),
                            ),
                          )
                        ])),
              );
            }));
  }
}
