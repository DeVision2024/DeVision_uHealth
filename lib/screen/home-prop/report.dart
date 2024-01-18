import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:google_fonts/google_fonts.dart';
import 'package:pie_chart/pie_chart.dart';

class ReportContainer extends StatefulWidget {
  const ReportContainer({super.key});

  @override
  State<ReportContainer> createState() => _ReportContainerState();
}

class _ReportContainerState extends State<ReportContainer> {
  @override
  Widget build(BuildContext context) {
    final now_email = FirebaseAuth.instance.currentUser!.email;
    final data_chart = {
      "Daily Nutrion": 50.0,
      "Daily Water": 40.0,
      "Daily Medicine": 10.0,
    };

    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('users')
            .doc(now_email.toString())
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Container(color: Colors.transparent);
          } else {
            Map? userData = snapshot.data?.data() as Map?;
            return Container(
              height: 330,
              width: 300,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  color: Colors.transparent),
              child: Stack(children: [
                Transform.rotate(
                  angle: -8.0,
                  child: Container(
                    height: double.infinity,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                        color: const Color(0xFF887440)),
                  ),
                ),
                Container(
                    height: double.infinity,
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                        color: const Color(0xFFDBB861)),
                    child: Column(
                      children: [
                        Text(
                          'Halo, ' + (userData?['nama_lengkap'] ?? ''),
                          style: GoogleFonts.inter(
                              fontWeight: FontWeight.w700, fontSize: 16),
                        ),
                        Text(
                          "Here's your daily report",
                          style: GoogleFonts.inter(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Colors.black54),
                        ),
                        const SizedBox(height: 20),
                        PieChart(
                          dataMap: data_chart,
                          chartValuesOptions: ChartValuesOptions(
                              showChartValues: true,
                              chartValueStyle: GoogleFonts.inter(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700),
                              showChartValuesInPercentage: true,
                              showChartValueBackground: false),
                          legendOptions: const LegendOptions(
                              legendPosition: LegendPosition.bottom),
                          chartRadius: 100,
                          chartType: ChartType.ring,
                          chartLegendSpacing: 20,
                          baseChartColor: Colors.grey[50]!.withOpacity(0.15),
                          colorList: const [
                            Color(0xFFD46F77),
                            Color(0xFF70A9B6),
                            Color(0xFFE0A154)
                          ],
                        ),
                      ],
                    ))
              ]),
            );
          }
        });
  }
}
