import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HealthRecord extends StatelessWidget {
  const HealthRecord({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Health Record',
            style:
                GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w700)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    spreadRadius: 0.1,
                    blurRadius: 10,
                    offset: Offset(2, 3))
              ]),
              child: ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                      backgroundColor: MaterialStateColor.resolveWith(
                          (states) => Colors.white),
                      padding: MaterialStateProperty.all(EdgeInsets.zero),
                      minimumSize:
                          MaterialStateProperty.all(const Size(170, 80)),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)))),
                  child: Row(
                    children: [
                      Image.asset('assets/e1.png', scale: 1),
                      Text('Medical \nRecord',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.inter(
                              fontSize: 11,
                              fontWeight: FontWeight.w700,
                              color: Colors.black))
                    ],
                  )),
            ),
            Container(
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    spreadRadius: 0.1,
                    blurRadius: 10,
                    offset: Offset(2, 3))
              ]),
              child: ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                      backgroundColor: MaterialStateColor.resolveWith(
                          (states) => Colors.white),
                      padding: MaterialStateProperty.all(EdgeInsets.zero),
                      minimumSize:
                          MaterialStateProperty.all(const Size(170, 80)),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)))),
                  child: Row(
                    children: [
                      Image.asset('assets/f1.png', scale: 1),
                      Text('Laboratory \nRecord',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.inter(
                              fontSize: 11,
                              fontWeight: FontWeight.w700,
                              color: Colors.black))
                    ],
                  )),
            ),
          ],
        )
      ],
    );
  }
}
