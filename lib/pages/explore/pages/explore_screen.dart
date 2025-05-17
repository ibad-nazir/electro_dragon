import 'package:electro_dragon/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../constants/colors.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.white60,
      statusBarIconBrightness: Brightness.light,
    ));
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 450,
              width: s_width,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.white60, Colors.black87],
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 70),
                      Row(
                        children: [
                          Image.asset('assets/logo.png', width: 32, height: 32),
                          Image.asset('assets/logo_word.png',
                              width: 90, height: 32),
                          Spacer(),
                          Icon(
                            Icons.search,
                            size: 25,
                            color: Colors.white,
                          ),
                        ],
                      ),
                      SizedBox(height: 140),
                      Container(
                        width: 35,
                        height: 20,
                        decoration: BoxDecoration(
                          color: Colors.black54,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            "1/5",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ),
                      Text(
                        "Computer Science",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                        ),
                      ),
                      Text(
                        "Get 50% discount for your greatest skill",
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 31,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Check Now",
                        style: TextStyle(
                          color: Colors.lightGreenAccent,
                          fontSize: 16,
                        ),
                      ),
                    ]),
              ),
            ),

            // Featured Banner
            // ClipRRect(
            //   borderRadius: BorderRadius.circular(12),
            //   child: Stack(
            //     children: [
            //       Container(
            //         width: double.infinity,
            //         height: 180,
            //         color: Colors.grey[400],
            //         child: const Center(
            //           child: Text("375 x 448",
            //               style: TextStyle(color: Colors.white)),
            //         ),
            //       ),
            //       Positioned(
            //         bottom: 0,
            //         left: 0,
            //         right: 0,
            //         child: Container(
            //           padding: const EdgeInsets.all(16),
            //           color: Colors.black.withOpacity(0.6),
            //           child: Column(
            //             crossAxisAlignment: CrossAxisAlignment.start,
            //             children: [
            //               const Text(
            //                 "Computer Science",
            //                 style: TextStyle(color: Colors.white, fontSize: 12),
            //               ),
            //               const SizedBox(height: 4),
            //               const Text(
            //                 "Get 50% discount for your greatest skill",
            //                 style: TextStyle(
            //                     color: Colors.white,
            //                     fontSize: 16,
            //                     fontWeight: FontWeight.bold),
            //               ),
            //               const SizedBox(height: 4),
            //               Container(
            //                 padding: const EdgeInsets.symmetric(
            //                     vertical: 2, horizontal: 8),
            //                 decoration: BoxDecoration(
            //                   color: Colors.green,
            //                   borderRadius: BorderRadius.circular(4),
            //                 ),
            //                 child: const Text(
            //                   "Check Now",
            //                   style:
            //                       TextStyle(color: Colors.white, fontSize: 12),
            //                 ),
            //               ),
            //             ],
            //           ),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),

            // Categories Section
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                children: [
                  const Text("Categories",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  Spacer(),
                  TextButton(
                    onPressed: () {},
                    child: Text("See all",
                        style: TextStyle(color: primaryColor, fontSize: 12)),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 18,
                    color: primaryColor,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: SizedBox(
                height: 188,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _buildCategoryCard("History", "50 courses"),
                    const SizedBox(width: 12),
                    _buildCategoryCard("Science", "83 courses"),
                    const SizedBox(width: 12),
                    _buildCategoryCard("Physics", "24 courses"),
                  ],
                ),
              ),
            ),

            // Popular Authors Section
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                children: [
                  const Text("Popular Authors",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  Spacer(),
                  TextButton(
                    onPressed: () {},
                    child: Text("See all",
                        style: TextStyle(color: primaryColor, fontSize: 12)),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 18,
                    color: primaryColor,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                children: [
                  _buildAuthorItem("Literature"),
                  const SizedBox(width: 16),
                  _buildAuthorItem("Marketing"),
                ],
              ),
            ),

            // New Releases Section
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("New Releases",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  TextButton(
                    onPressed: () {},
                    child: Text("See all",
                        style: TextStyle(color: primaryColor, fontSize: 12)),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                children: [
                  _buildNewReleaseCard("Creative"),
                  const SizedBox(width: 12),
                  _buildNewReleaseCard("Business", hasBookmark: true),
                ],
              ),
            ),

            // Course List
            const SizedBox(height: 24),

            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 12),
                        decoration: BoxDecoration(
                          color: Colors.grey[100],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          children: [
                            const Text("Most Popular",
                                style: TextStyle(fontWeight: FontWeight.w500)),
                            const Icon(Icons.keyboard_arrow_down, size: 20),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: 2,
                      height: 35,
                      color: Colors.grey[400],
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 12),
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.sort, size: 18),
                          const SizedBox(width: 4),
                          const Text("Sort"),
                        ],
                      ),
                    ),
                    const SizedBox(width: 12),
                    Container(
                      width: 2,
                      height: 35,
                      color: Colors.grey[400],
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 12),
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.filter_list, size: 18),
                          const SizedBox(width: 4),
                          const Text("Filter"),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Courses List
            _buildCourseItem(
              "Computer Science",
              rating: "4.5",
              lessons: "7 lessons",
            ),
            const Divider(),
            _buildCourseItem(
              "Nature & Environment",
              rating: "4.3",
              lessons: "5 lessons",
            ),
            const Divider(),
            _buildCourseItem(
              "Literature",
              rating: "4.7",
              lessons: "9 lessons",
              hasBookmark: true,
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: primaryColor,
        unselectedItemColor: Colors.grey,
        currentIndex: 1,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
          BottomNavigationBarItem(icon: Icon(Icons.book), label: "Explore"),
          BottomNavigationBarItem(icon: Icon(Icons.bookmark), label: "Saved"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: "Settings"),
        ],
      ),
    );
  }

  Widget _buildCategoryCard(String title, String subtitle) {
    return Container(
      width: 138,
      decoration: BoxDecoration(
        color: Colors.grey[600],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Spacer(),
          const Center(
              child: Text("138 x 188", style: TextStyle(color: Colors.white))),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Text(
                  subtitle,
                  style: TextStyle(fontSize: 12, color: Colors.white),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAuthorItem(String title) {
    return Container(
      width: 177,
      height: 70,
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 23,
              backgroundColor: Colors.grey[300],
              child: const Text("AV"),
            ),
            const SizedBox(width: 8),
            Text(title, style: const TextStyle(fontSize: 12)),
          ],
        ),
      ),
    );
  }

  Widget _buildNewReleaseCard(String title, {bool hasBookmark = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 155,
          height: 102,
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(12),
          ),
          child: Stack(
            children: [
              const Center(
                  child: Text("155 x 102",
                      style: TextStyle(color: Colors.black38))),
              if (hasBookmark)
                Positioned(
                  top: 8,
                  right: 8,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: const Icon(Icons.bookmark_border,
                        color: Colors.black, size: 16),
                  ),
                ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        Text(title, style: const TextStyle(fontSize: 14, color: Colors.grey)),
        const SizedBox(height: 2),
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

  Widget _buildCourseItem(String title,
      {required String rating,
      required String lessons,
      bool hasBookmark = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 8.0),
      child: Row(
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Center(
                child: Text("80 x 80",
                    style: TextStyle(color: Colors.white, fontSize: 12))),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(title,
                    style: const TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Text("1h 47m ", style: const TextStyle(fontSize: 12)),
                    const SizedBox(width: 4),
                    Text(lessons, style: const TextStyle(fontSize: 12)),
                    const SizedBox(width: 12),
                    Text(rating, style: const TextStyle(fontSize: 12)),
                    const SizedBox(width: 4),
                    const Icon(Icons.star, color: Colors.amber, size: 14),
                  ],
                ),
              ],
            ),
          ),
          BookmarkButton(initialState: hasBookmark),
        ],
      ),
    );
  }
}

// Create a separate stateful widget for the bookmark button
class BookmarkButton extends StatefulWidget {
  final bool initialState;

  const BookmarkButton({Key? key, this.initialState = false}) : super(key: key);

  @override
  State<BookmarkButton> createState() => _BookmarkButtonState();
}

class _BookmarkButtonState extends State<BookmarkButton> {
  late bool isBookmarked;

  @override
  void initState() {
    super.initState();
    isBookmarked = widget.initialState;
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        isBookmarked ? Icons.bookmark : Icons.bookmark_outline,
        color: isBookmarked ? Colors.red : null,
      ),
      onPressed: () {
        setState(() {
          isBookmarked = !isBookmarked;
        });
      },
    );
  }
}
