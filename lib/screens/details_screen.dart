// ignore_for_file: prefer_const_constructors

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app/widgets/widgets.dart';

class DetailsPage extends StatefulWidget {
  final String title, description, imagePath;
  final double price, rating;
  const DetailsPage({super.key, required this.title, required this.description, required this.imagePath, required this.price, required this.rating});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  bool isFav = false;
  int qty = 0;

  void toggleFav() {
    setState(() {
      isFav = !isFav;
    });
  }

  void addQty() {
    setState(() {
      qty += 1;
    });
  }

  void minusQty() {
    setState(() {
      qty -= 1;
      if (qty < 0) {
        qty = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade100,
        actions: [
          IconButton(
            onPressed: () {
              toggleFav();
            },
            icon: !isFav ? Icon(Icons.favorite_outline) : Icon(Icons.favorite),
          )
        ],
      ),
      body: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Column(
          children: [
            CachedNetworkImage(
                imageUrl: widget.imagePath,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        widget.title.substring(0, 10),
                        style:
                            TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.star_border_outlined,
                            color: Colors.yellow,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "${widget.rating}",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          )
                        ],
                      ),
                    ],
                  ),
                  Text(
                    "\$${widget.price}",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                        fontSize: 30),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Text(widget.description),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  detailContainer([
                    IconButton(
                      onPressed: () {
                        minusQty();
                      },
                      icon: Icon(
                        Icons.remove,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      "$qty",
                      style: TextStyle(color: Colors.white),
                    ),
                    IconButton(
                      onPressed: () {
                        addQty();
                      },
                      icon: Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                    ),
                  ]),
                  GestureDetector(
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(
                          "Order Placed Successfully",
                        ),
                        backgroundColor: Colors.green,
                      ));
                    },
                    child: detailContainer([
                      Text(
                        "PLACE ORDER",
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Icon(
                        Icons.shopping_cart_outlined,
                        color: Colors.white,
                      ),
                    ]),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
