import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';



class BuildRestaurantCard extends StatelessWidget {
  const BuildRestaurantCard({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) => Container(
        margin: const EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: AppColors.darkBackground,
            width: 1.5,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
              child: Image.network(
                "https://images.pexels.com/photos/70497/pexels-photo-70497.jpeg",
                height: 160,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Rose Garden Restaurant",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppColors.darkBackground,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "Burger • Chicken • Rice • Wings",
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.grey[700],
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.orange, size: 18),
                      const SizedBox(width: 4),
                      const Text("4.7"),
                      const SizedBox(width: 16),
                      const Icon(Icons.local_shipping, color: Colors.green, size: 18),
                      const SizedBox(width: 4),
                      const Text("Free"),
                      const SizedBox(width: 16),
                      const Icon(Icons.access_time, color: Colors.red, size: 18),
                      const SizedBox(width: 4),
                      const Text("20 min"),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
