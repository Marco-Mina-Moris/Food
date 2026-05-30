import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food/core/utils/app_colors.dart';
import 'package:food/features/chef/model/chef_models.dart';
import 'package:food/features/chef/view_model/chef_cubit.dart';

class ChefMenuGridItem extends StatelessWidget {
  final ChefMeal meal;

  const ChefMenuGridItem({
    super.key,
    required this.meal,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ChefCubit>();

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.iceGray, width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.015),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Dish Image & Category Tag
          Expanded(
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(19)),
                    image: DecorationImage(
                      image: NetworkImage(meal.image),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  top: 10,
                  left: 10,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.6),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      meal.category,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 6,
                  right: 6,
                  child: GestureDetector(
                    onTap: () => _confirmDeletion(context, meal),
                    child: Container(
                      padding: const EdgeInsets.all(6),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(Icons.delete_outline_rounded, color: AppColors.error, size: 18),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Dish Info
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  meal.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: AppColors.darkBlue,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  "\$${meal.price.toStringAsFixed(2)}",
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 15,
                    color: AppColors.orange,
                  ),
                ),
                const SizedBox(height: 8),

                // Availability Toggle
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      meal.isAvailable ? "In Stock" : "Out of Stock",
                      style: TextStyle(
                        fontSize: 11,
                        color: meal.isAvailable ? AppColors.green : AppColors.lightSteelBlue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                      width: 36,
                      child: Switch.adaptive(
                        value: meal.isAvailable,
                        activeColor: AppColors.green,
                        onChanged: (val) {
                          cubit.toggleAvailability(meal.id, val);
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _confirmDeletion(BuildContext context, ChefMeal meal) {
    final cubit = context.read<ChefCubit>();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          title: Text(
            "Delete Dish?",
            style: TextStyle(color: AppColors.darkBlue, fontWeight: FontWeight.bold),
          ),
          content: Text("Are you sure you want to remove '${meal.name}' from your menu?"),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("Cancel", style: TextStyle(color: AppColors.darkGray)),
            ),
            ElevatedButton(
              onPressed: () {
                cubit.deleteMeal(meal.id);
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("'${meal.name}' removed successfully."),
                    backgroundColor: AppColors.green,
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.error,
                elevation: 0,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              ),
              child: const Text("Delete", style: TextStyle(color: Colors.white)),
            ),
          ],
        );
      },
    );
  }
}
