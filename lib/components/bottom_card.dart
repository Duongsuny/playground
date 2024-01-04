import 'package:flutter/material.dart';
import 'package:playground/components/button.dart';
import 'package:playground/model/cart.dart';
import 'package:playground/model/dish.dart';
import 'package:provider/provider.dart';

class BottomCart extends StatefulWidget {
  final Dish dish;
  const BottomCart({super.key, required this.dish});

  @override
  State<BottomCart> createState() => _BottomCartState();
}

class _BottomCartState extends State<BottomCart> {
  @override
  int quantity = 1;
  void increment() {
    setState(() {
      quantity++;
    });
  }

  void decrement() {
    setState(() {
      quantity--;
    });
  }

  Widget build(BuildContext context) {
    return Consumer<Cart>(
        builder: (context, value, child) => Container(
            height: 150,
            decoration: const BoxDecoration(
                color: const Color.fromARGB(248, 109, 29, 29),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15))),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "\$${(widget.dish.price * quantity).toString()}",
                    style: const TextStyle(color: Colors.white, fontSize: 25),
                  ),
                  GestureDetector(
                    onTap: () => decrement(),
                    child: Container(
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: const Color.fromARGB(248, 146, 86, 86)),
                        child: const Icon(
                          Icons.remove,
                          color: Colors.white,
                        )),
                  ),
                  Text(
                    quantity.toString(),
                    style: const TextStyle(color: Colors.white, fontSize: 25),
                  ),
                  GestureDetector(
                    onTap: () => increment(),
                    child: Container(
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: const Color.fromARGB(248, 146, 86, 86)),
                        child: const Icon(
                          Icons.add,
                          color: Colors.white,
                        )),
                  ),

                  //add to cart button and its following alert
                  GestureDetector(
                      onTap: () {
                        {
                          value.addToCart(widget.dish, quantity);
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: const Text("Added to cart!"),
                                  content: Text(
                                      "You have added $quantity ${widget.dish.name} to your cart.."),
                                );
                              });
                        }
                      },
                      child: const SushiButton(text: "Add to cart", height: 50))
                ],
              ),
            )));
  }
}
