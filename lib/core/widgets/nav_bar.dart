import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:navigation_assignment/core/colors/colors.dart';

class NavBar extends StatelessWidget {
  const NavBar({
    required this.navigationShell,
    Key? key,
  }) : super(key: key ?? const ValueKey<String>('NavBar'));

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: whitethemeColor,
        elevation: 0,
        type: BottomNavigationBarType.fixed,

        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/icons/Vector (4).svg',
                color: Colors.black,
              ),
              backgroundColor: Colors.black,
              label: 'Home',),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/icons/Vector (6).svg',
                color: Colors.black,
              ),
              label: 'Books',),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/icons/Vector (5).svg',
                color: Colors.black,
              ),
              label: 'Authors',),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/icons/Vector (7).svg',
                color: Colors.black,
              ),
              label: 'Settings',),
        ],

        currentIndex: navigationShell.currentIndex,
        onTap: (int tappedIndex) {
          navigationShell.goBranch(tappedIndex);
        },
        // showSelectedLabels: false,
// showUnselectedLabels: false,
      ),
    );
  }
}




