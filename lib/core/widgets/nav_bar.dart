import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:navigation_assignment/core/colors/colors.dart';
import 'package:navigation_assignment/features/author/presentation/pages/author_list_screen.dart';
import 'package:navigation_assignment/features/books/presentation/pages/books_list_screen.dart';
import 'package:navigation_assignment/features/home/presentation/pages/home_screen.dart';
import 'package:navigation_assignment/features/settings/presentation/pages/settings.dart';

class NavBar extends StatefulWidget {
  const NavBar({
    required this.navigationShell,
    Key? key,
  }) : super(key: key ?? const ValueKey<String>('NavBar'));

  final StatefulNavigationShell navigationShell;

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int selectedIndex = 0;
  final FirebaseAnalytics analytics = FirebaseAnalytics.instance;
  static List pagesNames = ['Home', 'Books', 'Authors', 'Settings'];

  // static List<Widget> widgetOptions = <Widget>[
  //   HomeScreen(),
  //   BooksScreen(),
  //   AuthorsScreen(),
  // ];

  @override
  void initState() {
    analytics.setAnalyticsCollectionEnabled(true);
    super.initState();
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.navigationShell,
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
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/Vector (6).svg',
              color: Colors.black,
            ),
            label: 'Books',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/Vector (5).svg',
              color: Colors.black,
            ),
            label: 'Authors',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/Vector (7).svg',
              color: Colors.black,
            ),
            label: 'Settings',
          ),
        ],

        currentIndex: widget.navigationShell.currentIndex,
        onTap: (int tappedIndex) async {
          print('before execution');
          await FirebaseAnalytics.instance.logEvent(name: 'pages_tracked', 

          parameters: {
            "page_name": pagesNames[tappedIndex],
            "page_index": tappedIndex,
            
          });
          setState(() {
            selectedIndex = tappedIndex;
          });
          widget.navigationShell.goBranch(tappedIndex);
        },
        
        // showSelectedLabels: false,
// showUnselectedLabels: false,
      ),
    );
  }
}
