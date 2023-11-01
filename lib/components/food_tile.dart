import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:restaurant/models/food.dart';

class FoodTile extends StatelessWidget {
  final Food food;
  const FoodTile({super.key, required this.food});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: Colors.grey[100], borderRadius: BorderRadius.circular(20)),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.all(0),
              child: Image.asset(
                food.imagePatch,
                height: 80,
              ),
            ),
            Text(
              food.name,
              style: GoogleFonts.dmSerifDisplay(fontSize: 20),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: 80,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(food.price),
                    SizedBox(
                      child: Row(
                        children: [
                          Icon(Icons.star, color: Colors.yellow[500]),
                          Text(food.rating)
                        ],
                      ),
                    )
                  ]),
            )
          ]),
    );
  }
}
