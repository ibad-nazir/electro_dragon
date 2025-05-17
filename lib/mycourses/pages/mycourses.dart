import 'package:flutter/material.dart';
import '../../constants/colors.dart';

class MyCoursesPage extends StatefulWidget {
  const MyCoursesPage({Key? key}) : super(key: key);

  @override
  State<MyCoursesPage> createState() => _MyCoursesPageState();
}

class _MyCoursesPageState extends State<MyCoursesPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F6F6),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.filter_list, color: Colors.black),
          onPressed: () {},
        ),
        title: const Text(
          'My Courses',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 28,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.black),
            onPressed: () {},
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(48),
          child: Column(
            children: [
              TabBar(
                controller: _tabController,
                indicatorColor: primaryColor,
                labelColor: Colors.black,
                unselectedLabelColor: Colors.grey,
                labelStyle: const TextStyle(fontWeight: FontWeight.bold),
                tabs: const [
                  Tab(text: 'In Progress'),
                  Tab(text: 'Downloads'),
                ],
              ),
              const SizedBox(height: 8),
            ],
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _inProgressTab(),
          Center(
              child:
                  Text('No Downloads', style: TextStyle(color: Colors.grey))),
        ],
      ),
      bottomNavigationBar: _bottomNavBar(),
    );
  }

  Widget _inProgressTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 8),
          SizedBox(
            height: 140,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                _courseCard('Science', '7 courses', 0.73),
                const SizedBox(width: 16),
                _courseCard('Business', '12 courses', 0.45),
              ],
            ),
          ),
          const SizedBox(height: 24),
          const Text(
            'Latest Courses',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          const SizedBox(height: 16),
          _latestCourseTile('Entrepreneurship', 0.67),
          const SizedBox(height: 16),
          _latestCourseTile('Data & Analytics', 0.85),
          const SizedBox(height: 16),
          _latestCourseTile('Strategy', 0.29),
        ],
      ),
    );
  }

  Widget _courseCard(String title, String subtitle, double progress) {
    return Container(
      width: 180,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(12),
        image: const DecorationImage(
          image: AssetImage(
              'assets/logo.png'), // Placeholder, replace with real image
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(Colors.black26, BlendMode.darken),
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            left: 12,
            bottom: 32,
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
          Positioned(
            left: 12,
            bottom: 16,
            child: Text(
              subtitle,
              style: const TextStyle(
                color: Colors.white70,
                fontSize: 13,
              ),
            ),
          ),
          Positioned(
            right: 12,
            bottom: 12,
            child: SizedBox(
              width: 36,
              height: 36,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  CircularProgressIndicator(
                    value: progress,
                    backgroundColor: Colors.white24,
                    valueColor: AlwaysStoppedAnimation<Color>(primaryColor),
                    strokeWidth: 4,
                  ),
                  Center(
                    child: Text(
                      '${(progress * 100).toInt()}%',
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _latestCourseTile(String title, double progress) {
    return Row(
      children: [
        Container(
          width: 56,
          height: 56,
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Center(
              child: Text('80 x 80', style: TextStyle(color: Colors.grey))),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style:
                    const TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
              ),
              const SizedBox(height: 8),
              Stack(
                children: [
                  Container(
                    height: 6,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(3),
                    ),
                  ),
                  Container(
                    height: 6,
                    width: MediaQuery.of(context).size.width * progress * 0.6,
                    decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(3),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(width: 8),
        Text('${(progress * 100).toInt()}%',
            style: const TextStyle(color: Colors.grey)),
      ],
    );
  }

  Widget _bottomNavBar() {
    return BottomNavigationBar(
      currentIndex: 1, // My Courses
      selectedItemColor: primaryColor,
      unselectedItemColor: Colors.grey,
      showUnselectedLabels: true,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.grid_view),
          label: 'Browse',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.menu_book),
          label: 'My Courses',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.bookmark_border),
          label: 'Bookmarks',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.notifications_none),
          label: 'Notifications',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline),
          label: 'Account',
        ),
      ],
      onTap: (index) {
        // Handle navigation
      },
    );
  }
}
