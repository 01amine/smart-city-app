import 'package:bsc/features/home/domain/entities/feedback.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyReview extends StatelessWidget {
  final String imagePath;
  const MyReview({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    // Sample data for reviews
    final reviews = [
      Review(
        profilePic: 'assets/profile1.png',
        userName: 'John Doe',
        review: 'Amazing place! Loved the ambiance and service.',
      ),
      Review(
        profilePic: 'assets/profile2.png',
        userName: 'Jane Smith',
        review: 'Great experience. Would recommend it to anyone!',
      ),
      Review(
        profilePic: 'assets/profile3.png',
        userName: 'Alice Brown',
        review: 'Good value for money, but the room could be cleaner.',
      ),
    ];

    return ListView.builder(
      shrinkWrap: true,
      itemCount: reviews.length,
      itemBuilder: (context, index) {
        final review = reviews[index];
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: _buildReviewWidget(review),
        );
      },
    );
  }

  Widget _buildReviewWidget(Review review) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          radius: 20,
          backgroundImage: AssetImage(review.profilePic),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                review.userName,
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                review.review,
                style: GoogleFonts.inter(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
