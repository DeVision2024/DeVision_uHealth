import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RowHeader extends StatelessWidget {
  const RowHeader({
    super.key,
    required this.userData,
  });

  final Map? userData;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Halo,\n' + (userData?['nama_lengkap'] ?? ''),
          style: GoogleFonts.inter(
              color: const Color(0xFFDBB861),
              fontWeight: FontWeight.w700,
              fontSize: 32),
        ),
        Container(
            decoration: BoxDecoration(
                color: Color(0xFFDBB861),
                borderRadius: BorderRadius.circular(100)),
            child: const Icon(Icons.person, size: 80, color: Colors.white)),
      ],
    );
  }
}
