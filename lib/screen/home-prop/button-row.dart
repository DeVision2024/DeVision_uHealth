import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uhealth/screen/daily_check.dart';
import 'package:uhealth/screen/online_consultation.dart';

class ButtonRowHome extends StatelessWidget {
  const ButtonRowHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          decoration: BoxDecoration(
              border: Border.all(
                  color: Color(0xFFDBB861).withOpacity(0.65), width: 4),
              borderRadius: BorderRadius.circular(10)),
          child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const DailyCheck()));
              },
              style: ButtonStyle(
                  backgroundColor: MaterialStateColor.resolveWith(
                      (states) => const Color(0xffffffff)),
                  padding: MaterialStateProperty.all(EdgeInsets.zero),
                  minimumSize: MaterialStateProperty.all(const Size(100, 80)),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)))),
              child: Column(
                children: [
                  Image.asset('assets/g1.png', scale: 1.5),
                  Text('Daily Checkup',
                      style: GoogleFonts.inter(
                          fontSize: 11,
                          fontWeight: FontWeight.w700,
                          color: Colors.black))
                ],
              )),
        ),
        Container(
          decoration: BoxDecoration(
              border: Border.all(
                  color: Color(0xFFDBB861).withOpacity(0.65), width: 4),
              borderRadius: BorderRadius.circular(10)),
          child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const OnlineConsultation()));
              },
              style: ButtonStyle(
                  backgroundColor: MaterialStateColor.resolveWith(
                      (states) => const Color(0xffffffff)),
                  padding: MaterialStateProperty.all(EdgeInsets.zero),
                  minimumSize: MaterialStateProperty.all(const Size(100, 80)),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)))),
              child: Column(
                children: [
                  Image.asset('assets/h1.png', scale: 1.5),
                  Text('Consultation',
                      style: GoogleFonts.inter(
                          fontSize: 11,
                          fontWeight: FontWeight.w700,
                          color: Colors.black))
                ],
              )),
        ),
        Container(
          decoration: BoxDecoration(
              border: Border.all(
                  color: Color(0xFFDBB861).withOpacity(0.65), width: 4),
              borderRadius: BorderRadius.circular(10)),
          child: ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                  backgroundColor: MaterialStateColor.resolveWith(
                      (states) => const Color(0xffffffff)),
                  padding: MaterialStateProperty.all(EdgeInsets.zero),
                  minimumSize: MaterialStateProperty.all(const Size(100, 80)),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)))),
              child: Column(
                children: [
                  Image.asset('assets/i1.png', scale: 1.5),
                  Text('Forum',
                      style: GoogleFonts.inter(
                          fontSize: 11,
                          fontWeight: FontWeight.w700,
                          color: Colors.black))
                ],
              )),
        ),
      ],
    );
  }
}
