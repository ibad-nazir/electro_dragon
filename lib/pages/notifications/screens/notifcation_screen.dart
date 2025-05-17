import 'package:electro_dragon/mycourses/pages/mycourses.dart';
import 'package:electro_dragon/pages/bookmarks/screens/bookmarks_screen.dart';
import 'package:electro_dragon/pages/home/screens/home_screen.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  int _selectedIndex = 3; // Start with notifications selected

  void _onItemTapped(int index) {
    if (index == _selectedIndex) return; // Don't navigate if same index

    switch (index) {
      case 0:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => HomeScreen(),
          ),
        );
        break;
      case 1:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => MyCoursesScreen(),
          ),
        );
        break;
      case 2:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => BookmarksScreen(),
          ),
        );
        ;
        break;
      case 3:
        // Already on notifications
        break;
      case 4:
        Navigator.pushReplacementNamed(context, '/account');
        break;
    }
  }

  Widget _notificationItem(
      {bool isFollowing = false,
      bool isPicture = false,
      bool isNotFollowing = false}) {
    return Container(
      height: 80, // Fixed height for all notifications
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Row(
        children: [
          // Avatar
          CircleAvatar(
            radius: 22.5,
            backgroundColor: Colors.grey[300],
            child: const Text('45 x 45',
                style: TextStyle(fontSize: 10, color: Colors.grey)),
          ),
          const SizedBox(width: 16),
          // Expanded for spacing
          Expanded(child: Container()),

          if (isPicture)
            Container(
              width: 60,
              height: 60,
              color: Colors.grey[300],
              child: Center(
                child: const Text('60 x 60',
                    style: TextStyle(fontSize: 10, color: Colors.grey)),
              ),
            ),

          if (isFollowing)
            SizedBox(
              width: 130,
              height: 32,
              child: TextButton(
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                    side: const BorderSide(color: Colors.black),
                  ),
                ),
                onPressed: () {},
                child: const Text('Following',
                    style: TextStyle(color: Colors.black)),
              ),
            ),
          if (isNotFollowing)
            SizedBox(
              width: 100,
              height: 32,
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                onPressed: () {},
                child:
                    const Text('Follow', style: TextStyle(color: Colors.white)),
              ),
            ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.filter_list, color: Colors.black),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_horiz, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: 7, // 1 for title + 6 notification items
          itemBuilder: (context, index) {
            if (index == 0) {
              return Text(
                'Notifications',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 32,
                ),
              );
            }

            // Adjust index to match the original notification items
            final adjustedIndex = index - 1;
            Widget notificationItem;

            if (adjustedIndex == 0 ||
                adjustedIndex == 4 ||
                adjustedIndex == 5) {
              notificationItem = _notificationItem(isPicture: true);
            } else if (adjustedIndex == 1 || adjustedIndex == 2) {
              notificationItem = _notificationItem(isFollowing: true);
            } else {
              notificationItem = _notificationItem(isNotFollowing: true);
            }

            return Column(
              children: [
                notificationItem,
                if (index < 6) // Don't add divider after the last item
                  const Divider(height: 1),
              ],
            );
          },
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
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
      ),
    );
  }
}
