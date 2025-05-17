import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  Widget _notificationItem({bool isFollowing = false, bool isPicture = false}) {
    return Padding(
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
          // Follow/Following Button
          SizedBox(
            width: 80,
            height: 32,
            child: isFollowing
                ? OutlinedButton(
                    onPressed: () {},
                    child: const Text('Following',
                        style: TextStyle(color: Colors.black)),
                  )
                : ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                    ),
                    onPressed: () {},
                    child: const Text('Follow'),
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
        child: ListView(
          children: [
            Text(
              'Notifications',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 32,
              ),
            ),
            _notificationItem(),
            _notificationItem(),
            _notificationItem(isFollowing: true),
            _notificationItem(),
            _notificationItem(),
            _notificationItem(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 3,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
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
