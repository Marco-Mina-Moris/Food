import 'package:flutter/material.dart';
import 'package:food/core/utils/app_colors.dart';
import 'package:food/features/chef/model/chef_models.dart';

class ChefReviewItem extends StatelessWidget {
  final ChefReview review;

  const ChefReviewItem({
    super.key,
    required this.review,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              review.userName,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
                color: AppColors.darkBlue,
              ),
            ),
            Row(
              children: [
                const Icon(Icons.star_rounded, color: Colors.amber, size: 16),
                const SizedBox(width: 4),
                Text(
                  "${review.rating}",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                    color: AppColors.darkBlue,
                  ),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 2),
        Text(
          review.date,
          style: TextStyle(color: AppColors.lightSteelBlue, fontSize: 10),
        ),
        const SizedBox(height: 6),
        Text(
          review.comment,
          style: TextStyle(
            fontSize: 13,
            color: AppColors.darkGray,
          ),
        ),
      ],
    );
  }
}
