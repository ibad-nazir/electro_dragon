import 'package:flutter/material.dart';
import 'package:electro_dragon/pages/search/screens/search_screen.dart';

import 'package:electro_dragon/pages/bookmarks/screens/bookmarks_screen.dart';
import 'package:electro_dragon/pages/notifications/screens/notifcation_screen.dart';
import 'package:electro_dragon/pages/auth/screens/account_screen.dart';

import '../mycourses/pages/mycourses.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;

  const CustomBottomNavBar({
    Key? key,
    required this.currentIndex,
  }) : super(key: key);

  void _onItemTapped(BuildContext context, int index) {
    if (index == currentIndex) return;

    switch (index) {
      case 0:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const SearchScreen()),
        );
        break;
      case 1:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const MyCoursesScreen()),
        );
        break;
      case 2:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const BookmarksScreen()),
        );
        break;
      case 3:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const NotificationScreen()),
        );
        break;
      case 4:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const AccountScreen()),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.grey,
      onTap: (index) => _onItemTapped(context, index),
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Browse'),
        BottomNavigationBarItem(
            icon: Icon(Icons.menu_book), label: 'My Courses'),
        BottomNavigationBarItem(
            icon: Icon(Icons.bookmark_border), label: 'Bookmarks'),
        BottomNavigationBarItem(
            icon: Icon(Icons.notifications), label: 'Notifications'),
        BottomNavigationBarItem(
            icon: Icon(Icons.person_outline), label: 'Account'),
      ],
    );
  }
}
