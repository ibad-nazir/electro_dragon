import 'package:electro_dragon/main.dart';
import 'package:flutter/material.dart';

class BookmarkItem extends StatelessWidget {
  final String title;
  final String rating;
  final int reviews;
  final bool isBookmarked;
  final VoidCallback? onBookmarkTap;

  const BookmarkItem({
    Key? key,
    required this.title,
    required this.rating,
    required this.reviews,
    this.isBookmarked = true,
    this.onBookmarkTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            Container(
              width: s_width * 0.45,
              height: 110,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Center(
                child: Text(
                  '163 x 110',
                  style: TextStyle(color: Colors.black38, fontSize: 18),
                ),
              ),
            ),
            Positioned(
              top: 8,
              right: 8,
              child: GestureDetector(
                onTap: onBookmarkTap,
                child: Icon(
                  Icons.bookmark,
                  color: isBookmarked ? Colors.red : Colors.grey,
                  size: 24,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
        ),
        const SizedBox(height: 18),
        Row(
          children: [
            ...List.generate(
              int.parse(rating.split('.')[0]),
              (index) => const Icon(Icons.star, color: Colors.amber, size: 16),
            ),
            const SizedBox(width: 2),
            Text(
              rating,
              style: const TextStyle(fontSize: 13, color: Colors.black87),
            ),
            const SizedBox(width: 2),
            Text(
              '($reviews)',
              style: const TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ],
        ),
      ],
    );
  }
}
