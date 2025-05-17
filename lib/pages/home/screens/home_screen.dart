import 'package:electro_dragon/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constants/colors.dart';
import '../../explore/pages/explore_screen.dart';
import '../../../mycourses/pages/mycourses.dart';
import '../../bookmarks/screens/bookmarks_screen.dart';
import '../../notifications/screens/notifcation_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _selectedTab = 'History';

  @override
  Widget build(BuildContext context) {
    // Set status bar color to match app theme
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: primaryColor,
      statusBarIconBrightness: Brightness.light,
    ));

    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Column(
          children: [
            _buildSearchBar(),
            Expanded(
              child: ListView(
                children: [
                  _buildCarousel(),
                  _buildSectionHeader('Top Authors', true),
                  _buildAuthorsRow(),
                  _buildSectionHeader('Recommended Courses', true),
                  _buildCoursesRow(),
                  _buildSectionHeader('Popular Skills', true),
                  _buildSkillsGrid(),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      padding: EdgeInsets.all(12),
      color: primaryColor,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            height: 40,
            decoration: BoxDecoration(
              color: Colors.blue[800],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                Icon(Icons.search, color: Colors.white70),
                SizedBox(width: 8),
                Text(
                  'Search',
                  style: TextStyle(color: Colors.white70, fontSize: 16),
                ),
              ],
            ),
          ),
          SizedBox(height: 12),
          Row(
            children: [
              _buildTabItem('History', _selectedTab == 'History'),
              _buildTabItem('Politics', _selectedTab == 'Politics'),
              _buildTabItem('Language', _selectedTab == 'Language'),
              _buildTabItem('Math', _selectedTab == 'Math'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTabItem(String title, bool isSelected) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedTab = title;
        });
        print('Switched to $title tab');
      },
      child: Padding(
        padding: EdgeInsets.only(right: 24),
        child: Column(
          children: [
            Text(
              title,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.white70,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
            SizedBox(height: 4),
            Container(
              height: 2,
              width: 40,
              color: isSelected ? Colors.white : Colors.transparent,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCarousel() {
    return Container(
      height: 260,
      decoration: BoxDecoration(
        color: primaryColor,
      ),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 12),
        height: 180,
        // width: s_width * 0.8,
        child: PageView.builder(
          itemCount: 3,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.black87,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.all(0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            'Explore your future here',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Get 50% Discount',
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(height: 16),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ExploreScreen(),
                              ),
                            );
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 16, vertical: 8),
                            decoration: BoxDecoration(
                              color: Colors.orange,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              'Explore',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 16,
                    left: 0,
                    right: 0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        3,
                        (i) => Container(
                          margin: EdgeInsets.symmetric(horizontal: 4),
                          width: 8,
                          height: 8,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: i == index
                                ? Colors.white
                                : Colors.white.withOpacity(0.5),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title, bool hasViewAll) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 22),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          if (hasViewAll)
            Row(
              children: [
                Text(
                  title == 'Popular Skills' ? 'See all ' : 'VIEW ALL',
                  style: TextStyle(
                    color: primaryColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Icon(
                  title == 'Popular Skills'
                      ? Icons.chevron_right
                      : Icons.arrow_forward_ios,
                  size: title == 'Popular Skills' ? 16 : 12,
                  color: primaryColor,
                )
              ],
            ),
        ],
      ),
    );
  }

  Widget _buildAuthorsRow() {
    final authors = [
      {'name': 'Davidama alam', 'image': 'assets/avatar1.png'},
      {'name': 'Sophia Herete', 'image': 'assets/avatar2.png'},
      {'name': 'Foster alamer', 'image': 'assets/avatar3.png'},
      {'name': 'Richard Green', 'image': 'assets/avatar4.png'},
      {'name': 'Leo Decent', 'image': 'assets/avatar5.png'},
    ];

    return Container(
      height: 130,
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: authors.length,
        itemBuilder: (context, index) {
          return Container(
            width: 70,
            margin: EdgeInsets.only(right: 16),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.grey[300],
                  child: Text(authors[index]['name']![0]),
                ),
                SizedBox(height: 4),
                FittedBox(
                  child: SizedBox(
                    width: 70,
                    child: Column(
                      children: _formatNameInTwoLines(authors[index]['name']!),
                    ),
                  ),
                ),
                SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.play_circle_outline,
                      size: 10,
                    ),
                    SizedBox(width: 4),
                    Text(
                      '87',
                      style: TextStyle(fontSize: 10),
                    ),
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildCoursesRow() {
    return Container(
      height: 270,
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          _buildCourseCard('256 x 168', '4h 22m', '4.3', true),
          _buildCourseCard('25', '1h 13m', '4.8', false),
          _buildCourseCard('320 x 240', '2h 45m', '4.5', true),
        ],
      ),
    );
  }

  Widget _buildCourseCard(
      String title, String duration, String rating, bool isGreen) {
    return Container(
      width: 256,
      height: 280,
      margin: EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 168,
            width: 256,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
            ),
            alignment: Alignment.center,
            child: Stack(
              children: [
                Center(
                  child: Text(
                    title,
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                ),
                Positioned(
                  top: 10,
                  right: 10,
                  child: Icon(
                    Icons.bookmark_border,
                    color: Colors.white,
                    size: 24,
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 10,
            width: 44,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: isGreen ? Colors.green : Colors.blue,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      "1h -47",
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      ". 7 Lessons",
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                      ),
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Icon(Icons.star, size: 12, color: Colors.amber),
                    Text(
                      "4.7",
                      style: GoogleFonts.poppins(fontSize: 12),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    CircleAvatar(
                      radius: 16,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      children: [
                        Text(
                          "John Doe",
                          style: GoogleFonts.poppins(fontSize: 12),
                        ),
                        Text(
                          "Finance",
                          textAlign: TextAlign.left,
                          style: GoogleFonts.poppins(fontSize: 10),
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSkillsGrid() {
    final skills = [
      {'title': 'Creative Arts', 'courses': '538 courses'},
      {'title': 'Literature', 'courses': '637 courses'},
      {'title': 'Politics', 'courses': '371 courses'},
      {'title': 'Healthcare', 'courses': '732 courses'},
    ];

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 1.5,
        ),
        itemCount: skills.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              // Handle skill item tap
              print('Tapped on ${skills[index]['title']}');
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[400],
                borderRadius: BorderRadius.circular(8),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.grey.shade300, Colors.grey.shade600],
                ),
              ),
              child: Stack(
                children: [
                  // Large background text
                  Center(
                    child: Text(
                      '128 x 96',
                      style: TextStyle(
                        color: Colors.black26,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  // Content
                  Padding(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            skills[index]['title'] as String,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                            ),
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          skills[index]['courses'] as String,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: primaryColor,
      unselectedItemColor: Colors.grey,
      currentIndex: 0,
      items: [
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
          icon: Icon(Icons.notifications),
          label: 'Notifications',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.more_horiz),
          label: 'More',
        ),
      ],
      onTap: (index) {
        if (index == 1) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => MyCoursesScreen(),
            ),
          );
        } else if (index == 2) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => BookmarksScreen(),
            ),
          );
        } else if (index == 3) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => NotificationScreen(),
            ),
          );
        }
      },
    );
  }

  List<Widget> _formatNameInTwoLines(String name) {
    final words = name.split(' ');
    final textStyle = TextStyle(fontSize: 12, height: 1.2);

    if (words.length == 1) {
      return [
        Text(
          name,
          style: textStyle,
          textAlign: TextAlign.center,
        )
      ];
    } else if (words.length == 2) {
      return [
        Text(
          words[0],
          style: textStyle,
          textAlign: TextAlign.center,
        ),
        Text(
          words[1],
          style: textStyle,
          textAlign: TextAlign.center,
        )
      ];
    } else {
      // For names with more than 2 words, show first word on first line
      // and remaining words on second line
      return [
        Text(
          words[0],
          style: textStyle,
          textAlign: TextAlign.center,
        ),
        Text(
          words.sublist(1).join(' '),
          style: textStyle,
          textAlign: TextAlign.center,
        )
      ];
    }
  }
}
