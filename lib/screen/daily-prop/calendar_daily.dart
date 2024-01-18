import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CalendarDaily extends StatelessWidget {
  const CalendarDaily({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Calendar',
          style: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w700),
        ),
        Container(
            height: 70,
            alignment: Alignment.centerLeft,
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
                color: Color(0xFF9EB384),
                borderRadius: BorderRadius.circular(7),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.25),
                      spreadRadius: 1,
                      blurRadius: 4,
                      offset: Offset(3, 5))
                ]),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                    height: 50,
                    width: 50,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: Text(
                      '01',
                      style: GoogleFonts.inter(
                          fontSize: 24, fontWeight: FontWeight.w700),
                    )),
                Container(
                    height: 50,
                    width: 50,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: Text(
                      '02',
                      style: GoogleFonts.inter(
                          fontSize: 24, fontWeight: FontWeight.w700),
                    )),
                Container(
                    height: 50,
                    width: 50,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: Text(
                      '03',
                      style: GoogleFonts.inter(
                          fontSize: 24, fontWeight: FontWeight.w700),
                    )),
                Container(
                    height: 50,
                    width: 50,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: Text(
                      '04',
                      style: GoogleFonts.inter(
                          fontSize: 24, fontWeight: FontWeight.w700),
                    )),
              ],
            ))
      ],
    );
  }
}
