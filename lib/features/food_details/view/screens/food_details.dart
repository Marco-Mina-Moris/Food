import 'package:flutter/material.dart';

class FoodDetails extends StatefulWidget {
  FoodDetails({super.key});

  @override
  State<FoodDetails> createState() => _FoodDetailsState();
}

class _FoodDetailsState extends State<FoodDetails> {
  int quantity = 2;

  int selectedSize = 14;
  // default size
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  // ===== Header =====
                  Row(
                    children: const [
                      Icon(Icons.arrow_back, color: Colors.black54),
                      SizedBox(width: 8),
                      Text("Details",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  const SizedBox(height: 20),

                  // ===== Product Image =====
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.orange.shade100,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Stack(
                      children: [
                        Center(
                          child: Image.network(
                            "https://img.icons8.com/color/200/000000/pizza.png",
                            height: 180,
                          ),
                        ),
                        Positioned(
                          right: 0,
                          top: 0,
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(Icons.favorite_border,
                                color: Colors.red),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),

                  // ===== Restaurant Info =====
                  Container(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade300,
                          blurRadius: 5,
                          spreadRadius: 1,
                        )
                      ],
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Icon(Icons.store, color: Colors.red),
                        SizedBox(width: 8),
                        Text("Uttora Caffe House",
                            style: TextStyle(fontWeight: FontWeight.w500)),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),

                  // ===== Product Title & Desc =====
                  const Text(
                    "Pizza Calzone European",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 6),
                  const Text(
                    "Prosciutto e funghi is a pizza variety that is topped with tomato sauce.",
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

                  // ===== Size Options =====
                  const Text("SIZE:",
                      style:
                      TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [10, 14, 16].map((size) {
                      bool isSelected = selectedSize == size;
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedSize = size;
                          });
                        },
                        child: Container(
                          margin: const EdgeInsets.only(right: 12),
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: isSelected
                                ? Colors.orange
                                : Colors.grey.shade200,
                            shape: BoxShape.circle,
                          ),
                          child: Text(
                            "$size\"",
                            style: TextStyle(
                              color: isSelected ? Colors.white : Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 20),

                  // ===== Ingredients =====
                  const Text("INGREDIENTS",
                      style:
                      TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      buildIngredient(Icons.local_pizza),
                      buildIngredient(Icons.egg_alt),
                      buildIngredient(Icons.set_meal),
                      buildIngredient(Icons.local_dining),
                      buildIngredient(Icons.rice_bowl),
                    ],
                  ),
                ],
              ),
            ),

            // ===== Bottom Price & Quantity =====
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.shade300,
                      blurRadius: 10,
                      spreadRadius: 2)
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "\$32",
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  Container(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            if (quantity > 1) {
                              setState(() {
                                quantity--;
                              });
                            }
                          },
                          child: const Icon(Icons.remove,
                              color: Colors.white, size: 20),
                        ),
                        const SizedBox(width: 12),
                        Text(
                          "$quantity",
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(width: 12),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              quantity++;
                            });
                          },
                          child: const Icon(Icons.add,
                              color: Colors.white, size: 20),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildIngredient(IconData icon) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.orange.shade50,
        shape: BoxShape.circle,
      ),
      child: Icon(icon, color: Colors.orange, size: 28),
    );
  }
}
