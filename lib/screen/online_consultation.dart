import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uhealth/screen/consultation-prop/header_consult.dart';
import 'package:uhealth/screen/home_page.dart';

class OnlineConsultation extends StatefulWidget {
  const OnlineConsultation({super.key});

  @override
  State<OnlineConsultation> createState() => _OnlineConsultationState();
}

class _OnlineConsultationState extends State<OnlineConsultation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            HeaderConsultant(),
            StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('users')
                    .where('tipe_akun', isEqualTo: 'Dokter')
                    .snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(
                        child: Text('Tidak ada Dokter yang tersedia'));
                  } else {
                    return Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      height: 200,
                      child: ListView(
                          children: snapshot.data!.docs.map((e) {
                        return Card(
                            child: GestureDetector(
                          onTap: () {},
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            decoration: BoxDecoration(
                                color: Color(0xFF4F6F52),
                                borderRadius: BorderRadius.circular(10)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  e.data()['nama_lengkap'],
                                  style: GoogleFonts.inter(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 20),
                                ),
                                Text(
                                  (e.data()['jabatan'] ??
                                      'Jabatan Tidak diketahui'),
                                  style: GoogleFonts.inter(color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ));
                      }).toList()),
                    );
                  }
                })
          ],
        ));
  }
}
