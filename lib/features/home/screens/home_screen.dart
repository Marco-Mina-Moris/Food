import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //   return Scaffold();
    // }
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            // ===== Delivery Section =====
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: const [
                    Icon(Icons.menu, color: Colors.black54),
                    SizedBox(width: 8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "DELIVER TO",
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text("Halal Lab office",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w500)),
                      ],
                    ),
                  ],
                ),
                Stack(
                  children: [
                    const Icon(Icons.shopping_bag_outlined,
                        size: 28, color: Colors.black87),
                    Positioned(
                      right: 0,
                      top: 0,
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: const BoxDecoration(
                          color: Colors.orange,
                          shape: BoxShape.circle,
                        ),
                        child: const Text(
                          "2",
                          style: TextStyle(color: Colors.white, fontSize: 10),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),

            // ===== Greeting =====
            const Text.rich(
              TextSpan(
                text: "Hey Halal, ",
                style: TextStyle(fontSize: 18),
                children: [
                  TextSpan(
                    text: "Good Afternoon!",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // ===== Search =====
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const TextField(
                decoration: InputDecoration(
                  icon: Icon(Icons.search),
                  hintText: "Search dishes, restaurants",
                  border: InputBorder.none,
                ),
              ),
            ),
            const SizedBox(height: 20),

            // ===== Categories =====
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text("All Categories",
                    style:
                    TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Text("See All", style: TextStyle(color: Colors.orange)),
              ],
            ),
            const SizedBox(height: 12),

            SizedBox(
              height: 140,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  buildCategory("Pizza", "70",
                      "https://img.icons8.com/color/96/000000/pizza.png"),
                  buildCategory("Burger", "50",
                      "https://img.icons8.com/color/96/000000/hamburger.png"),
                  buildCategory("Pasta", "40",
                      "https://img.icons8.com/color/96/000000/spaghetti.png"),
                  buildCategory("Sandwich", "30",
                      "https://img.icons8.com/color/96/000000/sandwich.png"),
                  buildCategory("Sushi", "90",
                      "https://img.icons8.com/color/96/000000/sushi.png"),
                  buildCategory("Drinks", "10",
                      "https://img.icons8.com/color/96/000000/cola.png"),
                  buildCategory("Dessert", "20",
                      "https://img.icons8.com/color/96/000000/cupcake.png"),
                  buildCategory("Salad", "15",
                      "https://img.icons8.com/color/96/000000/salad.png"),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // ===== Open Restaurants =====
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text("Open Restaurants",
                    style:
                    TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Text("See All", style: TextStyle(color: Colors.orange)),
              ],
            ),
            const SizedBox(height: 12),

            // Restaurants List
            Column(
              children: [
                buildRestaurantCard(
                  "Rose Garden Restaurant",
                  "Burger - Chicken - Riche - Wings",
                  "https://images.pexels.com/photos/70497/pexels-photo-70497.jpeg",
                  "4.7",
                  "Free",
                  "20 min",
                ),
                const SizedBox(height: 16),
                buildRestaurantCard(
                  "Italiano Pasta House",
                  "Pasta - Pizza - Salad",
                  "https://images.pexels.com/photos/2232/vegetables-italian-pizza-restaurant.jpg",
                  "4.8",
                  "Free",
                  "25 min",
                ),
                const SizedBox(height: 16),
                buildRestaurantCard(
                  "Sushi Master",
                  "Sushi - Ramen - Rolls",
                  "https://images.pexels.com/photos/3577565/pexels-photo-3577565.jpeg",
                  "4.9",
                  "\$5",
                  "30 min",
                ),
                const SizedBox(height: 16),
                buildRestaurantCard(
                  "Sandwich World",
                  "Sandwich - Fries - Drinks",
                  "https://images.pexels.com/photos/1600711/pexels-photo-1600711.jpeg",
                  "4.5",
                  "Free",
                  "15 min",
                ),
                const SizedBox(height: 16),
                buildRestaurantCard(
                  "Sweet Dreams",
                  "Cakes - Desserts - Coffee",
                  "https://images.pexels.com/photos/302680/pexels-photo-302680.jpeg",
                  "4.6",
                  "Free",
                  "18 min",
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  // ===== Widget for Category =====
  Widget buildCategory(String title, String price, String imgUrl) {
    return Container(
      width: 110,
      margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            blurRadius: 6,
            spreadRadius: 2,
          )
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(imgUrl, height: 60),
          const SizedBox(height: 8),
          Text(title,
              style:
              const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
          Text("Starting \$$price",
              style: const TextStyle(fontSize: 12, color: Colors.black54)),
        ],
      ),
    );
  }

  // ===== Widget for Restaurant Card =====
  Widget buildRestaurantCard(String name, String desc, String imgUrl,
      String rating, String delivery, String time) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(imgUrl,
              height: 160, width: double.infinity, fit: BoxFit.cover),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                Text(desc, style: const TextStyle(color: Colors.black54)),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(Icons.star, color: Colors.orange, size: 18),
                    const SizedBox(width: 4),
                    Text(rating),
                    const SizedBox(width: 16),
                    const Icon(Icons.local_shipping,
                        color: Colors.green, size: 18),
                    const SizedBox(width: 4),
                    Text(delivery),
                    const SizedBox(width: 16),
                    const Icon(Icons.access_time,
                        color: Colors.red, size: 18),
                    const SizedBox(width: 4),
                    Text(time),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}