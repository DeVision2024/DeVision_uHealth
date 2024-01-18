import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uhealth/bottom_bar.dart';
import 'package:uhealth/screen/home_page.dart';

class HeaderConsultant extends StatelessWidget {
  const HeaderConsultant({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      decoration: const BoxDecoration(
          color: Color(0xFF4F6F52),
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20))),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CustomBottomNavBar()));
              },
              icon: const Icon(
                Icons.arrow_back_rounded,
                color: Colors.white,
              )),
          const SizedBox(width: 30),
          Text(
            'Doctor Available',
            style: GoogleFonts.inter(
                fontSize: 24, color: Colors.white, fontWeight: FontWeight.w700),
          )
        ],
      ),
    );
  }
}
