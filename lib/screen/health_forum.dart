import 'package:flutter/material.dart';

class HealthForum extends StatefulWidget {
  const HealthForum({super.key});

  @override
  State<HealthForum> createState() => _HealthForumState();
}

class _HealthForumState extends State<HealthForum> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFF4F6F52),
      body: Center(
        child: Text('Health Forum Page'),
      ),
    );
  }
}
