import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'map_prop/button-row.dart';
import 'map_prop/maps.dart';

class MapsPage extends StatefulWidget {
  const MapsPage({super.key});

  @override
  State<MapsPage> createState() => _MapsPageState();
}

class _MapsPageState extends State<MapsPage> {
  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Maps(),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20),
              child: Column(
                children: [
                  Text(
                    'Find nearby hospitals and pharmacys!',
                    style: GoogleFonts.inter(
                        fontWeight: FontWeight.w700, fontSize: 16),
                  ),
                ],
              ),
            ),
            SizedBox(height: 40),
            ButtonRowMap(),
          ],
        ),
      ),
    );
  }
}
