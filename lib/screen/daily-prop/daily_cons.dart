import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DailyConsumption extends StatelessWidget {
  const DailyConsumption({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Daily Consumption',
            style:
                GoogleFonts.inter(fontWeight: FontWeight.w700, fontSize: 14)),
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
                          (states) => const Color(0xffffffff)),
                      padding: MaterialStateProperty.all(EdgeInsets.zero),
                      minimumSize:
                          MaterialStateProperty.all(const Size(100, 80)),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)))),
                  child: Column(
                    children: [
                      Image.asset('assets/c1.png', scale: 1.5),
                      Text('Daily Nutrion',
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
                          (states) => const Color(0xffffffff)),
                      padding: MaterialStateProperty.all(EdgeInsets.zero),
                      minimumSize:
                          MaterialStateProperty.all(const Size(100, 80)),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)))),
                  child: Column(
                    children: [
                      Image.asset('assets/a1.png', scale: 1.5),
                      Text('Daily Medicine',
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
                          (states) => const Color(0xffffffff)),
                      padding: MaterialStateProperty.all(EdgeInsets.zero),
                      minimumSize:
                          MaterialStateProperty.all(const Size(100, 80)),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)))),
                  child: Column(
                    children: [
                      Image.asset('assets/b1.png', scale: 1.5),
                      Text('Daily Water',
                          style: GoogleFonts.inter(
                              fontSize: 11,
                              fontWeight: FontWeight.w700,
                              color: Colors.black))
                    ],
                  )),
            ),
          ],
        ),
      ],
    );
  }
}
