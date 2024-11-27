import 'package:flutter/material.dart';
import 'package:shopping_app/home/screens/details_screen.dart';
import "package:cached_network_image/cached_network_image.dart";

class GridBox extends StatelessWidget {
  final String title, imagePath, description;
  final double price, rating;
  const GridBox({super.key, required this.title, required this.imagePath, required this.price, required this.description, required this.rating});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: CachedNetworkImage(
              imageUrl: imagePath,
            ),
          ),
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "\$${price.toStringAsFixed(2)}",
                  style: const TextStyle(color: Color.fromARGB(255, 201, 127, 214)),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailsPage(
                            title: title,
                            description: description,
                            price: price,
                            rating: rating,
                            imagePath: imagePath,
                          ),
                        ));
                  },
                  icon: const Icon(
                    Icons.remove_red_eye,
                    color: Colors.red,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
