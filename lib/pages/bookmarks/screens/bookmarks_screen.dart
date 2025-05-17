import 'package:flutter/material.dart';
import '../../../mycourses/pages/mycourses.dart';
import '../../notifications/screens/notifcation_screen.dart';
import '../widgets/bookmark_item.dart';
import '../../home/screens/home_screen.dart';

class BookmarksScreen extends StatefulWidget {
  const BookmarksScreen({Key? key}) : super(key: key);

  @override
  State<BookmarksScreen> createState() => _BookmarksScreenState();
}

class _BookmarksScreenState extends State<BookmarksScreen> {
  int _selectedIndex = 2;

  void _onItemTapped(int index) {
    if (index == _selectedIndex) return;

    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0: // Browse
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomeScreen()),
        );
        break;
      case 1: // My Courses
        // TODO: Replace with actual MyCoursesScreen when available
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const MyCoursesScreen()),
        );
        break;
      case 2: // Bookmarks
        // Already on Bookmarks screen
        break;
      case 3: // Notifications
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const NotificationScreen()),
        );
        break;
      case 4: // Account
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Account screen coming soon!')),
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
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Browse'),
          BottomNavigationBarItem(
              icon: Icon(Icons.menu_book), label: 'My Courses'),
          BottomNavigationBarItem(
              icon: Icon(Icons.bookmark), label: 'Bookmarks'),
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications), label: 'Notifications'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Account'),
        ],
      ),
    );
  }
}
