import 'package:flutter/material.dart';
import 'package:playground/components/bottom_card.dart';
import 'package:playground/model/cart.dart';
import 'package:playground/model/dish.dart';
import 'package:provider/provider.dart';

class Description extends StatefulWidget {
  final Dish dish;
  const Description({super.key, required this.dish});

  @override
  State<Description> createState() => _DescriptionState();
}

class _DescriptionState extends State<Description> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
        builder: (context, value, child) => Scaffold(
            appBar: AppBar(
              title: Text(widget.dish.name),
              foregroundColor: Colors.black,
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //image
                  Image.asset(widget.dish.url, height: 200),
                  const SizedBox(height: 20),

                  //dish name and star
                  Text(widget.dish.name,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 30)),

                  // dish description
                  Text(widget.dish.description),

                  // add to cart
                  BottomCart(dish: widget.dish),
                ],
              ),
            )));
  }
}
