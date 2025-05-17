import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constants/colors.dart';
import '../../search/screens/search_screen.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Set status bar color to match app theme
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
    ));

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    Text(
                      'Will you going to learn',
                      style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontSize: 27,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SearchScreen(),
                          ),
                        );
                      },
                      child: Row(
                        children: [
                          Text(
                            'All Categories',
                            style: GoogleFonts.poppins(
                              color: primaryColor,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline,
                              decorationColor: primaryColor,
                              decorationThickness: 2,
                              decorationStyle: TextDecorationStyle.dotted,
                              fontSize: 25,
                            ),
                          ),
                          Icon(Icons.keyboard_arrow_down,
                              color: Colors.blue, size: 18),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 13),
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: Icon(Icons.search, color: Colors.grey[500]),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SearchScreen(),
                              ),
                            );
                          },
                          child: Text(
                            "Search for everything...",
                            style: TextStyle(
                              color: Colors.grey[500],
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Divider(),
                const SizedBox(height: 16),
                _buildLargeCategoryList([
                  'Authors',
                  'New Releases',
                  'Programming',
                  'Design',
                  'Marketing'
                ]),
                const SizedBox(height: 16),
                _buildRecommendedSection(),
                const SizedBox(height: 16),
                _buildSortFilterBar(),
                const SizedBox(height: 16),
                _buildCategoryGrid([
                  'Creative Arts',
                  'Business',
                  'Photography',
                  'Health',
                  'Science'
                ]),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          if (index == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SearchScreen(),
              ),
            );
          }
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.search), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.bookmark_border), label: ''),
          BottomNavigationBarItem(
              icon: Icon(Icons.play_circle_outline), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.more_horiz), label: ''),
        ],
      ),
    );
  }

  Widget _buildLargeCategoryList(List<String> categories) {
    return SizedBox(
      height: 246,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        separatorBuilder: (context, index) => SizedBox(width: 12),
        itemBuilder: (context, index) {
          return _buildLargeCategoryCard(categories[index]);
        },
      ),
    );
  }

  Widget _buildLargeCategoryCard(String title) {
    return Container(
      width: 163,
      height: 246,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: LinearGradient(
          colors: [Colors.grey[300]!, Colors.black54],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Stack(
        children: [
          Center(
            child: Text(
              '163 x 246',
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 18,
              ),
            ),
          ),
          Positioned(
            bottom: 24,
            left: 0,
            right: 0,
            child: Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryGrid(List<String> categories) {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 163 / 170,
        crossAxisSpacing: 12,
        mainAxisSpacing: 16,
      ),
      itemCount: categories.length,
      itemBuilder: (context, index) {
        return _buildCategoryCard(categories[index],
            hasBookmark: categories[index] == 'Business');
      },
    );
  }

  Widget _buildCategoryCard(String title, {bool hasBookmark = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          height: 110,
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey[200]!),
            gradient: LinearGradient(
              colors: [Colors.black12, Colors.black54],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Stack(
            children: [
              Center(
                child: Text(
                  '163 × 110',
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 14,
                  ),
                ),
              ),
              Positioned(
                top: 8,
                right: 8,
                child: BookmarkButton(),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        Text(title,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
            )),
        const SizedBox(height: 15),
        Row(
          children: [
            Icon(Icons.star, color: Colors.amber, size: 16),
            Icon(Icons.star, color: Colors.amber, size: 16),
            Icon(Icons.star, color: Colors.amber, size: 16),
            Icon(Icons.star, color: Colors.amber, size: 16),
            Icon(Icons.star_half, color: Colors.amber, size: 16),
            SizedBox(width: 4),
            Text('4.1 (963)',
                style: TextStyle(fontSize: 12, color: Colors.grey)),
          ],
        ),
      ],
    );
  }

  Widget _buildRecommendedSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Recommended Courses',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              children: [
                Text(
                  'See all',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 12,
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 12,
                  color: Colors.blue,
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 8),
        Container(
          height: 290,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              _buildCourseCard(
                  '4.1', '1h 47s', '7 lessons', 'Amanda Lockwood', 'Finance'),
              _buildCourseCard(
                  '4.3', '2h 15m', '9 lessons', 'John Smith', 'Business'),
              _buildCourseCard(
                  '4.2', '1h 30m', '5 lessons', 'Sarah Johnson', 'Marketing'),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildCourseCard(String rating, String duration, String lessons,
      String instructor, String category) {
    return Container(
      width: 326,
      height: 300,
      margin: EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        color: Colors.white,
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
            height: 205,
            width: 326,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
            ),
            alignment: Alignment.center,
            child: Stack(
              children: [
                Center(
                  child: Text(
                    '326 × 205',
                    style: TextStyle(color: Colors.grey[600], fontSize: 18),
                  ),
                ),
                Positioned(
                  top: 10,
                  right: 10,
                  child: BookmarkButton(),
                ),
                Positioned(
                  bottom: 10,
                  left: 10,
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(
                        10,
                      ),
                    ),
                    width: 70,
                    height: 20,
                  ),
                ),
              ],
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
                      duration,
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                    SizedBox(width: 5),
                    Text(
                      "• $lessons",
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                    SizedBox(width: 8),
                    Text(
                      rating,
                      style: TextStyle(fontSize: 12),
                    ),
                    SizedBox(width: 4),
                    Icon(Icons.star, size: 14, color: Colors.amber),
                    Text(
                      "(963)",
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    CircleAvatar(
                      radius: 12,
                      backgroundColor: Colors.grey[300],
                      child: Text(instructor[0],
                          style:
                              TextStyle(fontSize: 10, color: Colors.grey[600])),
                    ),
                    SizedBox(width: 8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          instructor,
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w500),
                        ),
                        Text(
                          category,
                          style: TextStyle(fontSize: 10, color: Colors.grey),
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

  Widget _buildSortFilterBar() {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.sort, size: 18, color: Colors.grey[700]),
                  SizedBox(width: 4),
                  Text(
                    'Sort',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[700],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: 1,
            height: 24,
            color: Colors.grey[300],
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.filter_list, size: 18, color: Colors.grey[700]),
                  SizedBox(width: 4),
                  Text(
                    'Filter',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[700],
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
}

// Bookmark button with save functionality
class BookmarkButton extends StatefulWidget {
  final bool initialState;

  const BookmarkButton({Key? key, this.initialState = false}) : super(key: key);

  @override
  _BookmarkButtonState createState() => _BookmarkButtonState();
}

class _BookmarkButtonState extends State<BookmarkButton> {
  late bool _isSaved;

  @override
  void initState() {
    super.initState();
    _isSaved = widget.initialState;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isSaved = !_isSaved;
        });
      },
      child: Container(
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: _isSaved ? Colors.red : Colors.black.withOpacity(0.3),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Icon(
          _isSaved ? Icons.bookmark : Icons.bookmark_border,
          color: Colors.white,
          size: 20,
        ),
      ),
    );
  }
}
