import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MedicalCondition extends StatelessWidget {
  const MedicalCondition({
    super.key,
    required this.userData,
  });

  final Map? userData;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Medical Condition',
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
          child: Text(
            (userData?['riwayat'] ?? ''),
            style: GoogleFonts.inter(
                fontSize: 28, fontWeight: FontWeight.w500, color: Colors.black),
          ),
        )
      ],
    );
  }
}
