import 'package:flutter/material.dart';

class FoodBurgers extends StatelessWidget {
  FoodBurgers({super.key});

  final List<Map<String, String>> burgers = [
    {
      "name": "Burger Bistro",
      "restaurant": "Rose Garden",
      "price": "\$40",
      "image": "https://img.icons8.com/color/96/000000/hamburger.png" // استبدل برابط صورة برجر حقيقي
    },
    {
      "name": "Smokin' Burger",
      "restaurant": "Cafenio Restaurant",
      "price": "\$60",
      "image": "https://img.icons8.com/color/96/000000/hamburger.png" // استبدل برابط صورة برجر حقيقي
    },
    {
      "name": "Buffalo Burgers",
      "restaurant": "Kaji Firm Kitchen",
      "price": "\$75",
      "image": "https://img.icons8.com/color/96/000000/hamburger.png" // استبدل برابط صورة برجر حقيقي
    },
    {
      "name": "Bullseye Burgers",
      "restaurant": "Kabab Restaurant",
      "price": "\$94",
      "image": "https://img.icons8.com/color/96/000000/hamburger.png" // استبدل برابط صورة برجر حقيقي
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // الجزء العلوي (فلاتر)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  DropdownButton<String>(
                    value: "BURGER",
                    icon: Icon(Icons.arrow_drop_down),
                    underline: SizedBox(),
                    items: <String>['BURGER'].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16)),
                      );
                    }).toList(),
                    onChanged: (_) {},
                  ),
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.black,
                        child: Icon(Icons.search, color: Colors.white),
                      ),
                      SizedBox(width: 10),
                      CircleAvatar(
                        backgroundColor: Colors.grey[300],
                        child: Icon(Icons.filter_list, color: Colors.black),
                      ),
                    ],
                  )
                ],
              ),

              SizedBox(height: 20),

              // Popular Burgers
              Text(
                "Popular Burgers",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.black87),
              ),

              SizedBox(height: 10),

              Expanded(
                flex: 2,
                child: GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: burgers.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 15,
                    childAspectRatio: 3 / 4,
                  ),
                  itemBuilder: (context, index) {
                    final burger = burgers[index];
                    return Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      elevation: 6,
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image.network(
                                burger["image"]!,
                                height: 100,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              burger["name"]!,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                            SizedBox(height: 5),
                            Text(
                              burger["restaurant"]!,
                              style: TextStyle(color: Colors.grey[600]),
                            ),
                            Spacer(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  burger["price"]!,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                                CircleAvatar(
                                  radius: 15,
                                  backgroundColor: Colors.orange,
                                  child: Icon(Icons.add, color: Colors.white),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),

              SizedBox(height: 10),

              // Open Restaurants
              Text(
                "Open Restaurants",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.black87),
              ),

              SizedBox(height: 10),

              Container(
                height: 120,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                        image: NetworkImage(
                            "https://images.pexels.com/photos/70497/pexels-photo-70497.jpeg"), // صورة للمطعم المفتوح
                        fit: BoxFit.cover)),
              ),

              SizedBox(height: 10),

              Text(
                "Tasty Treat Gallery",
                style:
                TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
              ),

              SizedBox(height: 5),

              Row(
                children: [
                  Icon(Icons.star, color: Colors.orange, size: 18),
                  Text(" 4.7  "),
                  Icon(Icons.local_shipping, color: Colors.grey, size: 18),
                  Text(" Free  "),
                  Icon(Icons.timer, color: Colors.grey, size: 18),
                  Text(" 20 min"),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

