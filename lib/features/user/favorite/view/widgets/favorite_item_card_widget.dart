import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animate_do/animate_do.dart';
import 'package:food/core/utils/app_colors.dart';
import 'package:food/features/user/meal_details/view/screens/meal_details_screen.dart';
import 'package:food/features/user/meal_details/view_model/model_detail_cubit.dart';

class FavoriteItemCardWidget extends StatelessWidget {
  final Map<String, dynamic> item;
  final int index;
  final VoidCallback onRemove;
  final VoidCallback onRefresh;

  const FavoriteItemCardWidget({
    super.key,
    required this.item,
    required this.index,
    required this.onRemove,
    required this.onRefresh,
  });

  @override
  Widget build(BuildContext context) {
    final idMeal = item['idMeal'] ?? '';
    final strMeal = item['strMeal'] ?? '';
    final strMealThumb = item['strMealThumb'] ?? '';
    final strCategory = item['strCategory'] ?? 'Unknown';
    final strArea = item['strArea'] ?? 'Unknown';

    return FadeInLeft(
      duration: Duration(milliseconds: 300 + (index * 50)),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => BlocProvider<ModelDetailCubit>(
                create: (context) => ModelDetailCubit()..getModelDetail(idMeal),
                child: MealDetailsScreen(mealId: idMeal),
              ),
            ),
          ).then((_) => onRefresh()); // Refresh when returning
        },
        child: Container(
          margin: const EdgeInsets.only(bottom: 16),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.03),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
            border: Border.all(
              color: AppColors.gray,
              width: 1,
            ),
          ),
          child: Row(
            children: [
              // Food Image
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  strMealThumb,
                  width: 80,
                  height: 80,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      width: 80,
                      height: 80,
                      color: AppColors.paleBlue,
                      child: const Icon(Icons.fastfood, color: Colors.grey),
                    );
                  },
                ),
              ),
              const SizedBox(width: 16),

              // Item Details
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      strMeal,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.sen(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: AppColors.veryDarkBlue,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '$strCategory • $strArea',
                      style: GoogleFonts.sen(
                        fontSize: 12,
                        color: AppColors.darkGray,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        const Icon(Icons.star, color: Colors.orange, size: 14),
                        const SizedBox(width: 4),
                        Text(
                          '4.8',
                          style: GoogleFonts.sen(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: AppColors.veryDarkBlue,
                          ),
                        ),
                        const SizedBox(width: 12),
                        const Icon(Icons.access_time, color: Colors.grey, size: 14),
                        const SizedBox(width: 4),
                        Text(
                          '25 min',
                          style: GoogleFonts.sen(
                            fontSize: 12,
                            color: AppColors.darkGray,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // Actions
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  // Red Heart to Unfavorite
                  GestureDetector(
                    onTap: onRemove,
                    child: Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: AppColors.paleBlue,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.favorite,
                        color: Colors.red,
                        size: 18,
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  // Plus Add button
                  Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: AppColors.orange,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 18,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
