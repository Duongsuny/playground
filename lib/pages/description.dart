import 'package:flutter/material.dart';
import 'package:playground/components/button.dart';
import 'package:playground/model/dish.dart';

class Description extends StatefulWidget {
  final Dish dish;
  const Description({super.key, required this.dish});

  @override
  State<Description> createState() => _DescriptionState();
}

class _DescriptionState extends State<Description> {
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              Container(
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
                          style: const TextStyle(
                              color: Colors.white, fontSize: 20),
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
                          style: const TextStyle(
                              color: Colors.white, fontSize: 20),
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
                        SushiButton(text: "Add to cart", height: 50)
                      ],
                    ),
                  ))
            ],
          ),
        ));
  }
}
