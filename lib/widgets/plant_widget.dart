import 'package:flutter/material.dart';

class PlantWidget extends StatelessWidget {
  PlantWidget({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.price,
    required this.rating,
    required this.screenWidth,
    required this.screenHeight,
  });

  String imageUrl;
  String name;
  int price;
  double rating;

  double screenWidth;
  double screenHeight;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: Image.asset(
            imageUrl,
          ),
          width: screenWidth * 0.5,
          height: screenHeight * 0.25,
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        Text(
          name,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        Row(
          children: [
            Icon(
              Icons.star,
              color: Colors.green,
            ),
            SizedBox(width: 10),
            Text(
              rating.toStringAsFixed(1),
              style: TextStyle(
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        Text(
          '\$' + price.toString(),
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
            color: Colors.green,
          ),
        ),
      ],
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    );
  }
}
