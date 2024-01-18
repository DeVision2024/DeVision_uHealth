import 'package:flutter/material.dart';

class NearestHospital extends StatefulWidget {
  const NearestHospital({super.key});

  @override
  State<NearestHospital> createState() => _NearestHospitalState();
}

class _NearestHospitalState extends State<NearestHospital> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFF4F6F52),
      body: Center(
        child: Text('Nearest Hospital Page'),
      ),
    );
  }
}
