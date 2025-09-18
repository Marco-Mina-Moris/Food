// import 'package:flutter/material.dart';
//
// import '../../model/response/restaurants_response.dart';
//
// class RecipeDetailsScreen extends StatelessWidget {
//   final Recipes recipe;
//
//   const RecipeDetailsScreen({super.key, required this.recipe});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text(recipe.name ?? "Recipe Details")),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Image.network(
//               recipe.image ?? "https://via.placeholder.com/150",
//               height: 200,
//               width: double.infinity,
//               fit: BoxFit.cover,
//             ),
//             const SizedBox(height: 16),
//             Text("Cuisine: ${recipe.cuisine ?? "Unknown"}",
//                 style: const TextStyle(fontSize: 16)),
//             const SizedBox(height: 8),
//             Text("Difficulty: ${recipe.difficulty ?? "N/A"}"),
//             const SizedBox(height: 8),
//             Text("Servings: ${recipe.servings ?? 0}"),
//             const SizedBox(height: 16),
//             const Text("Ingredients:",
//                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//             ...?recipe.ingredients?.map((i) => Text("• $i")),
//             const SizedBox(height: 16),
//             const Text("Instructions:",
//                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//             ...?recipe.instructions?.map((step) => Text("- $step")),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';

import '../../model/response/restaurants_response.dart';

class RecipeDetailsScreen extends StatelessWidget {
  final Recipes recipe;

  const RecipeDetailsScreen({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(recipe.name ?? "Recipe Details")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // الصورة
            Image.network(
              recipe.image ?? "https://via.placeholder.com/150",
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 16),

            // المعلومات الأساسية
            Text(
              "Cuisine: ${recipe.cuisine ?? "Unknown"}",
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),
            Text("Difficulty: ${recipe.difficulty ?? "N/A"}"),
            const SizedBox(height: 8),
            Text("Servings: ${recipe.servings ?? 0}"),
            const SizedBox(height: 8),
            Text("Calories per serving: ${recipe.caloriesPerServing ?? 0} cal"),
            const SizedBox(height: 8),
            Text(
              "Total Time: ${(recipe.prepTimeMinutes ?? 0) + (recipe.cookTimeMinutes ?? 0)} min",
            ),
            const SizedBox(height: 8),

            // التقييم
            Row(
              children: [
                const Icon(Icons.star, color: Colors.orange, size: 20),
                const SizedBox(width: 4),
                Text("${recipe.rating?.toStringAsFixed(1) ?? "0.0"}"),
                const SizedBox(width: 8),
                Text("(${recipe.reviewCount ?? 0} reviews)"),
              ],
            ),
            const SizedBox(height: 16),

            // Meal Type
            if (recipe.mealType != null)
              Text("Meal Type: ${recipe.mealType!.join(", ")}"),
            const SizedBox(height: 16),

            // Ingredients
            const Text(
              "Ingredients:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            ...?recipe.ingredients?.map((i) => Text("• $i")),
            const SizedBox(height: 16),

            // Instructions
            const Text(
              "Instructions:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            ...?recipe.instructions?.map(
              (step) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Text("- $step"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
