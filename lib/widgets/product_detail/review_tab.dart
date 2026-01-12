import 'package:flutter/material.dart';
import '../../config/theme/app_colors.dart';
import '../../models/product_detail_model.dart';

class ReviewsTab extends StatelessWidget {
  final List<Review> reviews;
  const ReviewsTab({super.key, required this.reviews});

  @override
  Widget build(BuildContext context) {
    if (reviews.isEmpty) {
      return const Center(child: Text('No reviews yet'));
    }

    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: reviews.length,
      separatorBuilder: (context, index) => const Divider(height: 24),
      itemBuilder: (context, index) {
        final review = reviews[index];
        final name = review.reviewerName;
        final comment = review.comment;
        final rating = review.rating.toInt();

        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 18,
              child: Text(name.isNotEmpty ? name[0] : ''),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: List.generate(
                      5,
                      (i) => Icon(
                        Icons.star,
                        size: 16,
                        color: i < rating ? Colors.amber : Colors.grey.shade300,
                      ),
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    comment,
                    style: TextStyle(color: AppColors.grey),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
