import 'package:flutter/material.dart';

class RestaurantView2 extends StatelessWidget {
  const RestaurantView2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Image مع فلاتر (ظلال و حواف دائرية)
              Stack(
                children: [
                  Container(
                    margin: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 10,
                          offset: Offset(0, 5),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.network(
                        'https://images.unsplash.com/photo-1565299624946-b28f40a0ae38',
                        height: 250,
                        width: double.infinity,
                        fit: BoxFit.cover,
                        colorBlendMode: BlendMode.multiply,
                        color: Colors.black.withOpacity(0.1), // فلتر خفيف
                      ),
                    ),
                  ),
                  Positioned(
                    left: 20,
                    top: 20,
                    child: CircleAvatar(
                      backgroundColor: Colors.white70,
                      child: Icon(Icons.arrow_back, color: Colors.black),
                    ),
                  ),
                  Positioned(
                    right: 20,
                    top: 20,
                    child: CircleAvatar(
                      backgroundColor: Colors.white70,
                      child: Icon(Icons.more_horiz, color: Colors.black),
                    ),
                  )
                ],
              ),

              SizedBox(height: 10),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  children: [
                    Icon(Icons.star, color: Colors.orange, size: 20),
                    SizedBox(width: 4),
                    Text(
                      '4.7',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: 16),
                    Icon(Icons.local_shipping, color: Colors.grey, size: 20),
                    SizedBox(width: 4),
                    Text('Free'),
                    SizedBox(width: 16),
                    Icon(Icons.access_time, color: Colors.grey, size: 20),
                    SizedBox(width: 4),
                    Text('20 min'),
                  ],
                ),
              ),

              SizedBox(height: 10),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Spicy Restaurant',
                      style:
                      TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 6),
                    Text(
                      'Mecenas sed diam eget risus varius blandit sit amet non magna. Integer posuere erat a ante venenatis dapibus posuere velit aliquet.',
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 16),

              // أزرار الفلترة
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    _buildFilterButton('Burger', isSelected: true),
                    _buildFilterButton('Sandwich'),
                    _buildFilterButton('Pizza'),
                    _buildFilterButton('Sandwich'),
                  ],
                ),
              ),

              SizedBox(height: 16),

              // قائمة البرجر
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Burger (10)',
                      style:
                      TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 12),

                    // المنتجات
                    Row(
                      children: [
                        _buildFoodCard(
                          imageUrl:
                          'https://images.unsplash.com/photo-1550547660-d9450f859349',
                          title: 'Burger Ferguson',
                          subtitle: 'Spicy Restaurant',
                          price: 40,
                          onAddPressed: () {},
                        ),
                        SizedBox(width: 16),
                        _buildFoodCard(
                          imageUrl:
                          'https://images.unsplash.com/photo-1547592180-7736c8d65882',
                          title: 'Rockin\' Burgers',
                          subtitle: 'Cafecafachino',
                          price: 40,
                          onAddPressed: () {},
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFilterButton(String title, {bool isSelected = false}) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 6),
      child: OutlinedButton(
        onPressed: () {},
        style: OutlinedButton.styleFrom(
          backgroundColor: isSelected ? Colors.orange : Colors.transparent,
          side: BorderSide(color: Colors.orange),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          foregroundColor: isSelected ? Colors.white : Colors.orange,
        ),
        child: Text(title),
      ),
    );
  }

  Widget _buildFoodCard({
    required String imageUrl,
    required String title,
    required String subtitle,
    required double price,
    required VoidCallback onAddPressed,
  }) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 8,
              offset: Offset(0, 4),
            )
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // صورة مع حواف دائرية على الأعلى فقط
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
              child: Image.network(
                imageUrl,
                height: 120,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding:
              const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10),
              child: Text(
                title,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                subtitle,
                style: TextStyle(color: Colors.grey[600], fontSize: 12),
              ),
            ),
            Padding(
              padding:
              const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '\$${price.toStringAsFixed(0)}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  GestureDetector(
                    onTap: onAddPressed,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding:
                      EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
