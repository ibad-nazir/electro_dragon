import 'package:electro_dragon/pages/home/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:electro_dragon/pages/search/screens/search_screen.dart';

import 'package:electro_dragon/pages/notifications/screens/notifcation_screen.dart';
import 'package:electro_dragon/pages/auth/screens/account_screen.dart';
import 'package:electro_dragon/widgets/custom_bottom_nav_bar.dart';
import '../../../mycourses/pages/mycourses.dart';
import '../widgets/bookmark_item.dart';

class BookmarksScreen extends StatefulWidget {
  const BookmarksScreen({Key? key}) : super(key: key);

  @override
  State<BookmarksScreen> createState() => _BookmarksScreenState();
}

class _BookmarksScreenState extends State<BookmarksScreen> {
  int _selectedIndex = 2;

  void _onItemTapped(int index) {
    if (index == _selectedIndex) return;

    switch (index) {
      case 0:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomeScreen()),
        );
        break;
      case 1:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const MyCoursesScreen()),
        );
        break;
      case 2:
        // Already on bookmarks
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
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.black),
            onPressed: () {},
          ),
        ],
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Bookmarks',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 28)),
            SizedBox(height: 16),
            Container(
              color: Colors.grey[005],
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                child: Row(
                  children: [
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(Icons.sort, size: 18, color: Colors.grey),
                          SizedBox(width: 4),
                          Text('Sort',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 17,
                              )),
                        ],
                      ),
                    ),
                    Container(width: 1, height: 24, color: Colors.grey[300]),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(
                            Icons.filter_list,
                            size: 18,
                            color: Colors.grey,
                          ),
                          SizedBox(width: 4),
                          Text('Filter',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 17,
                              )),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Divider(
              color: Colors.black12,
            ),
            SizedBox(height: 16),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: GridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  childAspectRatio: 163 / 170,
                  children: const [
                    BookmarkItem(
                        title: 'Creative Arts', rating: '4.1', reviews: 963),
                    BookmarkItem(
                        title: 'Business', rating: '5.0', reviews: 628),
                    BookmarkItem(
                        title: 'Politics', rating: '4.8', reviews: 168),
                    BookmarkItem(
                        title: 'Computer Science', rating: '4.1', reviews: 43),
                    BookmarkItem(
                        title: 'Entrepreneurship', rating: '4.8', reviews: 168),
                    BookmarkItem(title: 'Strategy', rating: '4.1', reviews: 43),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const CustomBottomNavBar(currentIndex: 2),
    );
  }
}
