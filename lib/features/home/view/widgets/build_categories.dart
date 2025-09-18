import 'package:flutter/material.dart';

class BuildCategories extends StatelessWidget {
  const BuildCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: 172,
      child: ListView.builder(

        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder:
            (context, index) => Container(
          margin: EdgeInsets.only(right: 16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: Colors.black12,
              width: 2,
            ),
          ),

          width: 147,

          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Image.network(
                    "https://img.icons8.com/color/96/000000/spaghetti.png",
                  ),
                ),
                Text("thing"),
                Row(
                  children: [
                    Text("Text"),
                    Spacer(),
                    Text("70\$"),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
