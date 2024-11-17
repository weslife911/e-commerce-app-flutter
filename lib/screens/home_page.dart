// ignore_for_file: prefer_const_constructors

import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shopping_app/models/product.dart';
import 'package:shopping_app/util/grid_box.dart';
import 'package:shopping_app/widgets/drawer.dart';
import '../const/const.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  final String email;
  const HomePage({super.key, required this.email});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController searchBoxController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade100,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.shopping_cart_outlined),
          )
        ],
      ),
      body: Center(
        child: Column(
          children: [
            searchBox(),
            FutureBuilder<List<Product>>(
              future: getProducts(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.connectionState == ConnectionState.none) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  if (snapshot.hasData) {
                    return Expanded(
                      child: GridView.builder(
                        padding: EdgeInsets.all(8),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 1 / 1,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 30,
                        ),
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          return GridBox(
                            title: snapshot.data![index].title!,
                            description: snapshot.data![index].description!,
                            imagePath: snapshot.data![index].imagePath!,
                            price: snapshot.data![index].price,
                            rating: snapshot.data![index].rating,
                          );
                        },
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return Center(child: Text("${snapshot.error}"));
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                }
              },
            )
          ],
        ),
      ),
      drawer: MyDrawer(
        email: widget.email,
      ),
    );
  }

  Widget searchBox() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 12),
      child: TextField(
        controller: searchBoxController,
        decoration: InputDecoration(
            filled: true,
            fillColor: Color.fromARGB(255, 224, 224, 224),
            border: InputBorder.none,
            hintText: "Search",
            prefixIcon: IconButton(
              onPressed: null,
              icon: Icon(
                Icons.search,
                color: Color.fromARGB(255, 158, 158, 158),
              ),
            ),
            suffixIcon: searchBoxController.text == ""
                ? null
                : IconButton(
                    onPressed: () {
                      searchBoxController.clear();
                    },
                    icon: Icon(Icons.cancel_outlined),
                  )),
      ),
    );
  }

  Future<List<Product>> getProducts() async {
    var url = Uri.parse(apiUrl);
    final response = await http.get(url);
    List productItems = [];
    if (response.statusCode == 200) {
      productItems = jsonDecode(response.body);
    } else {
      productItems = [];
    }
    return productItems.map((q) => Product.fromJson(q)).toList();
  }
}
