import 'package:flutter/material.dart';

import '../../model/meal_detail_response.dart';

class MealDetailWidget extends StatefulWidget {
  const MealDetailWidget({
    super.key,
    required this.meal,
    required this.rating,
    required this.time,
    required this.ingredients,
    required this.sizePrices,
    required this.ingredientIcons,
    required this.onSizeChanged,
  });

  final MealDetail meal;
  final double rating;
  final int time;
  final List<String> ingredients;
  final Map<String, Map<String, int>> sizePrices;
  final Map<String, IconData> ingredientIcons;
  final Function(String size) onSizeChanged;

  @override
  State<MealDetailWidget> createState() => _MealDetailWidgetState();
}

class _MealDetailWidgetState extends State<MealDetailWidget> {
  bool isFavorite = false;
  String selectedSize = "M";
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    final meal = widget.meal;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Stack(
              children: [
                // صورة الأكل
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.network(
                    meal.strMealThumb ?? "",
                    height: 220,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),

                Positioned(
                  top: 12,
                  right: 12,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        isFavorite = !isFavorite;
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.6),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        isFavorite ? Icons.favorite : Icons.favorite_border,
                        color: isFavorite ? Colors.red : Colors.black54,
                        size: 24,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // التفاصيل
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(Icons.store, size: 18, color: Colors.red),
                    const SizedBox(width: 6),
                    Text(
                      "Uttora Coffe House",
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                  ],
                ),
                const SizedBox(height: 8),

                Text(
                  meal.strMeal ?? "No Name",
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 6),

                Text(
                  "Category: ${meal.strCategory ?? ""} | Area: ${meal.strArea ?? ""}",
                  style: TextStyle(color: Colors.grey[600]),
                ),
                const SizedBox(height: 12),

                // تقييم + توصيل + وقت
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.star, color: Colors.orange, size: 18),
                        const SizedBox(width: 4),
                        Text(widget.rating.toString()),
                      ],
                    ),
                    const Text("Free Delivery"),
                    Row(
                      children: [
                        const Icon(Icons.timer, size: 18),
                        const SizedBox(width: 4),
                        Text("${widget.time} min"),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                // اختيار الحجم
                const Text(
                  "SIZE:",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Row(
                  children:
                      widget.sizePrices.keys.map((size) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: ChoiceChip(
                            label: Text(size),
                            selected: selectedSize == size,
                            onSelected: (val) {
                              setState(() {
                                selectedSize = size;
                              });
                              widget.onSizeChanged(size);
                            },
                          ),
                        );
                      }).toList(),
                ),
                const SizedBox(height: 20),

                // المكونات
                const Text(
                  "INGREDIENTS",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:
                      widget.ingredients
                          .map(
                            (item) => Padding(
                              padding: const EdgeInsets.symmetric(vertical: 4),
                              child: Row(
                                children: [
                                  Icon(
                                    widget.ingredientIcons[item] ??
                                        Icons.fastfood,
                                    color: Colors.orange,
                                  ),
                                  const SizedBox(width: 6),
                                  Text(item),
                                ],
                              ),
                            ),
                          )
                          .toList(),
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
