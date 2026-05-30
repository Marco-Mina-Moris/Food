import 'package:flutter/material.dart';

class RestaurantView extends StatelessWidget {
  const RestaurantView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            // ===== Header =====
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Icon(Icons.arrow_back, color: Colors.black54),
                Text("Restaurant View",
                    style:
                    TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Icon(Icons.more_horiz, color: Colors.black54),
              ],
            ),
            const SizedBox(height: 16),

            // ===== Restaurant Image =====
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(
                "https://images.pexels.com/photos/262978/pexels-photo-262978.jpeg",
                height: 180,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 16),

            // ===== Restaurant Info =====
            const Text(
              "Spicy Restaurant",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              "Maecenas sed diam eget risus varius blandit sit amet non magna. Integer posuere erat a ante venenatis dapibus posuere velit aliquet.",
              style: TextStyle(color: Colors.black54),
            ),
            const SizedBox(height: 16),

            // ===== Rating, Delivery, Time =====
            Row(
              children: const [
                Icon(Icons.star, color: Colors.orange, size: 18),
                SizedBox(width: 4),
                Text("4.7"),
                SizedBox(width: 16),
                Icon(Icons.local_shipping, color: Colors.green, size: 18),
                SizedBox(width: 4),
                Text("Free"),
                SizedBox(width: 16),
                Icon(Icons.access_time, color: Colors.red, size: 18),
                SizedBox(width: 4),
                Text("20 min"),
              ],
            ),
            const SizedBox(height: 20),

            // ===== Category Tabs =====
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  buildCategoryChip("Burger", true),
                  buildCategoryChip("Sandwich", false),
                  buildCategoryChip("Pizza", false),
                  buildCategoryChip("Snacks", false),
                  buildCategoryChip("Drinks", false),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // ===== Food List Title =====
            const Text(
              "Burger (10)",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            // ===== Food List =====
            GridView.count(
              shrinkWrap: true,
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              physics: const NeverScrollableScrollPhysics(),
              childAspectRatio: 0.8,
              children: [
                buildFoodCard(
                  "Burger Ferguson",
                  "Spicy Restaurant",
                  "https://images.pexels.com/photos/1633578/pexels-photo-1633578.jpeg",
                  "\$40",
                ),
                buildFoodCard(
                  "Rockin' Burgers",
                  "Cafecafachino",
                  "https://images.pexels.com/photos/1639562/pexels-photo-1639562.jpeg",
                  "\$40",
                ),
                buildFoodCard(
                  "Classic Beef Burger",
                  "Foodie House",
                  "https://images.pexels.com/photos/2983101/pexels-photo-2983101.jpeg",
                  "\$35",
                ),
                buildFoodCard(
                  "Cheese Burger",
                  "Food Mania",
                  "https://images.pexels.com/photos/315755/pexels-photo-315755.jpeg",
                  "\$38",
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // ===== Category Chip =====
  Widget buildCategoryChip(String text, bool isSelected) {
    return Container(
      margin: const EdgeInsets.only(right: 12),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: isSelected ? Colors.orange : Colors.grey.shade200,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: isSelected ? Colors.white : Colors.black,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  // ===== Food Card =====
  Widget buildFoodCard(
      String title, String subtitle, String imgUrl, String price) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Image.network(imgUrl,
                width: double.infinity, fit: BoxFit.cover),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 14)),
                const SizedBox(height: 4),
                Text(subtitle,
                    style: const TextStyle(
                        color: Colors.black54, fontSize: 12)),
                const SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(price,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.orange)),
                    Container(
                      padding: const EdgeInsets.all(6),
                      decoration: const BoxDecoration(
                        color: Colors.orange,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.add,
                          color: Colors.white, size: 18),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
