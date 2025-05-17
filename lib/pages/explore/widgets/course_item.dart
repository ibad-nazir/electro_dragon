import 'package:flutter/material.dart';

class CourseItem extends StatelessWidget {
  final String title;
  final String rating;
  final String lessons;
  final bool hasBookmark;

  final bool isFromDownlaods;

  const CourseItem({
    Key? key,
    required this.title,
    required this.rating,
    required this.lessons,
    this.hasBookmark = false,
    this.isFromDownlaods = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          if (hasBookmark) BookmarkButton(initialState: hasBookmark),
          if (isFromDownlaods)
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.settings),
            ),
        ],
      ),
    );
  }
}

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
