import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:uhealth/screen/account_page.dart';
import 'package:uhealth/screen/home_page.dart';
import 'package:uhealth/screen/maps_page.dart';

class CustomBottomNavBar extends StatefulWidget {
  const CustomBottomNavBar({super.key});

  @override
  State<CustomBottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<CustomBottomNavBar> {
  int selected_index = 0;
  final screen_list = [HomePage(), MapsPage(), AccountPage()];

  @override
  Widget build(BuildContext context) {
    Widget BottomNavBar() {
      return BottomAppBar(
        height: 60,
        shape: CircularNotchedRectangle(),
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      this.selected_index = 0;
                    });
                  },
                  child: SvgPicture.asset(
                    'assets/icons/home.svg',
                    width: 45,
                    height: 45,
                    color: Colors.black,
                  ),
                )),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      this.selected_index = 1;
                    });
                  },
                  child: SvgPicture.asset(
                    'assets/icons/sos-icon.svg',
                    width: 45,
                    height: 45,
                    color: Colors.black,
                  ),
                )),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      this.selected_index = 2;
                    });
                  },
                  child: SvgPicture.asset(
                    'assets/icons/profile.svg',
                    width: 45,
                    height: 45,
                    color: Colors.black,
                  ),
                )),
          ],
        ),
      );
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
          children: screen_list
              .asMap()
              .map((key, value) => (MapEntry(
                    key,
                    Offstage(
                      offstage: selected_index != key,
                      child: value,
                    ),
                  )))
              .values
              .toList()),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
