import 'package:flutter/material.dart';
import 'package:uhealth/screen/home-prop/button-row.dart';
import 'package:uhealth/screen/home-prop/report.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF4F6F52),
        body: Stack(children: [
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 450,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ReportContainer(),
                SizedBox(height: 50),
                ButtonRowHome(),
                SizedBox(height: 50),
              ],
            ),
          ),
        ]));
  }
}
