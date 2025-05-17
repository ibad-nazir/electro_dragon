import 'package:electro_dragon/pages/bookmarks/screens/bookmarks_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../constants/colors.dart';
import '../../pages/explore/widgets/course_item.dart';

class MyCoursesScreen extends StatefulWidget {
  const MyCoursesScreen({Key? key}) : super(key: key);

  @override
  State<MyCoursesScreen> createState() => _MyCoursesScreenState();
}

class _MyCoursesScreenState extends State<MyCoursesScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final List<Map<String, dynamic>> _downloadedCourses = [
    {
      'title': "Entrepreneurship",
      'rating': "4.5",
      'lessons': "7 lessons",
      'date': "2024-03-15",
    },
    {
      'title': "Data & Analytics",
      'rating': "3.8",
      'lessons': "3 lessons",
      'date': "2024-03-10",
    },
    {
      'title': "Strategy",
      'rating': "4.7",
      'lessons': "8 lessons",
      'date': "2024-03-05",
    },
    {
      'title': "Business",
      'rating': "3.8",
      'lessons': "3 lessons",
      'date': "2024-03-01",
    },
    {
      'title': "Strategy",
      'rating': "4.7",
      'lessons': "8 lessons",
      'date': "2024-02-28",
    },
  ];

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
      backgroundColor: Colors.grey[100],
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBar(
          elevation: 0,
          automaticallyImplyLeading: false,
          titleSpacing: 0,
          title: Padding(
            padding: const EdgeInsets.only(left: 16, top: 0, right: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.filter_list, color: Colors.black, size: 28),
                Icon(Icons.search, color: Colors.black, size: 28),
              ],
            ),
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding:
                const EdgeInsets.only(left: 16, top: 16, right: 16, bottom: 0),
            child: Text(
              'My Courses',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.bold,
                fontSize: 28,
              ),
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: TabBar(
              controller: _tabController,
              indicatorColor: primaryColor,
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey,
              labelStyle: GoogleFonts.poppins(
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
              tabs: [
                Tab(text: 'In Progress'),
                Tab(text: 'Downloads'),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _inProgressTab(),
                ListView.builder(
                  itemCount: _downloadedCourses.length,
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  itemBuilder: (context, index) {
                    final course = _downloadedCourses[index];
                    return Column(
                      children: [
                        CourseItem(
                          title: course['title'],
                          rating: course['rating'],
                          lessons: course['lessons'],
                          isFromDownlaods: true,
                          hasBookmark: false,
                        ),
                        if (index < _downloadedCourses.length - 1) Divider(),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: primaryColor,
        unselectedItemColor: Colors.grey,
        currentIndex: 1,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book_outlined),
            label: 'My Courses',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark_border),
            label: 'Saved',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.more_horiz),
            label: 'More',
          ),
        ],
        onTap: (index) {
          if (index == 0) {
            Navigator.pop(context);
          } else if (index == 2) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const BookmarksScreen()),
            );
          }
        },
      ),
    );
  }

  Widget _inProgressTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'In Progress',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: 180,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: [
                _courseCard('Science', '7 courses', 0.73),
                const SizedBox(width: 16),
                _courseCard('Business', '12 courses', 0.45),
              ],
            ),
          ),
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'Latest Courses',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
          const SizedBox(height: 16),
          _latestCourseTile('Entrepreneurship', 0.67),
          const SizedBox(height: 16),
          _latestCourseTile('Data & Analytics', 0.85),
          const SizedBox(height: 16),
          _latestCourseTile('Strategy', 0.29),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  Widget _courseCard(String title, String subtitle, double progress) {
    return Container(
      width: 256,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Stack(
        children: [
          Center(
            child: Text(
              '256 x 168',
              style: TextStyle(color: Colors.grey[500], fontSize: 22),
            ),
          ),
          Positioned(
            left: 16,
            bottom: 32,
            child: Text(
              title,
              style: GoogleFonts.poppins(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
          Positioned(
            left: 16,
            bottom: 16,
            child: Text(
              subtitle,
              style: GoogleFonts.poppins(
                color: Colors.black54,
                fontSize: 13,
              ),
            ),
          ),
          Positioned(
            right: 16,
            bottom: 16,
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
                      style: GoogleFonts.poppins(
                        color: Colors.black,
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Container(
            width: 80,
            height: 80,
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
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: 30),
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
                        color: Colors.green,
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
      ),
    );
  }
}
