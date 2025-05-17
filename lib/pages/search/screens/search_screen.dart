import 'package:flutter/material.dart';
import 'package:electro_dragon/widgets/custom_bottom_nav_bar.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final FocusNode _searchFocusNode = FocusNode();
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Request focus when the screen opens
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _searchFocusNode.requestFocus();
    });
  }

  @override
  void dispose() {
    _searchFocusNode.dispose();
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 23),
                Row(
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: TextField(
                        focusNode: _searchFocusNode,
                        controller: _searchController,
                        decoration: InputDecoration(
                          hintText: 'Search',
                          prefixIcon: Icon(Icons.search, color: Colors.grey),
                          filled: true,
                          fillColor: Colors.grey[200],
                          contentPadding:
                              EdgeInsets.symmetric(vertical: 0, horizontal: 16),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child:
                          Text('Cancel', style: TextStyle(color: Colors.black)),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Text('Top Searches',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                const SizedBox(height: 10),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    'History',
                    'Sport',
                    'Art',
                    'Entertainment',
                    'Outdoor',
                    'Music',
                    'Social',
                    'Nightlife',
                  'Concerts',
                    'Health',
                    'Submarine'
                  ]
                      .map((e) => Chip(
                            side: BorderSide.none,
                            label: Text(e),
                            backgroundColor: Colors.grey[200],
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                                side: BorderSide.none),
                          ))
                      .toList(),
                ),
                const SizedBox(height: 24),
                Text('Authors',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                const SizedBox(height: 10),
                SizedBox(
                  height: 120,
                  child: ListView.separated(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    separatorBuilder: (_, __) => SizedBox(width: 1),
                    itemBuilder: (context, index) {
                      final authors = [
                        {'name': 'Gerard Fabiano'},
                        {'name': 'Amber Julia'},
                        {'name': 'Fernando Agaro'},
                        {'name': 'Jane Sunny'},
                        {'name': 'Rich Moore'},
                      ];
                      return Column(
                        children: [
                          CircleAvatar(
                            radius: 32,
                            backgroundColor: Colors.grey[300],
                            child: Text('64 x 64',
                                style: TextStyle(
                                    fontSize: 10, color: Colors.grey[600])),
                          ),
                          const SizedBox(height: 8),
                          SizedBox(
                            width: 90,
                            child: Text(
                              authors[index]['name']!.replaceAll(' ', '\n'),
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 12),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
                const SizedBox(height: 24),
                Text('Courses',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                const SizedBox(height: 10),
                ListView.separated(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 3,
                  separatorBuilder: (_, __) => SizedBox(height: 16),
                  itemBuilder: (context, index) {
                    final courses = [
                      {
                        'title': 'Computer Science',
                        'duration': '1h 47s',
                        'lessons': '7 lessons',
                        'rating': '4.5',
                      },
                      {
                        'title': 'Nature & Environment',
                        'duration': '2h 13s',
                        'lessons': '3 lessons',
                        'rating': '3.8',
                      },
                      {
                        'title': 'Literature',
                        'duration': '1h 36s',
                        'lessons': '8 lessons',
                        'rating': '4.7',
                      },
                    ];
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Center(
                            child: Text('80 x 80',
                                style: TextStyle(
                                    fontSize: 12, color: Colors.grey[600])),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                courses[index]['title']!,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15),
                              ),
                              const SizedBox(height: 8),
                              Row(
                                children: [
                                  Text(
                                    courses[index]['duration']!,
                                    style: TextStyle(
                                        color: Colors.grey[600], fontSize: 12),
                                  ),
                                  const SizedBox(width: 8),
                                  Text('•',
                                      style: TextStyle(
                                          color: Colors.grey[600],
                                          fontSize: 12)),
                                  const SizedBox(width: 8),
                                  Text(
                                    courses[index]['lessons']!,
                                    style: TextStyle(
                                        color: Colors.grey[600], fontSize: 12),
                                  ),
                                  const SizedBox(width: 8),
                                  Icon(Icons.star,
                                      color: Colors.orange, size: 16),
                                  Text(
                                    courses[index]['rating']!,
                                    style: TextStyle(
                                        color: Colors.orange,
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: const CustomBottomNavBar(currentIndex: 0),
    );
  }
}
