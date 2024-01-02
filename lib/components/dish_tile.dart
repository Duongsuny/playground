import 'package:flutter/material.dart';
import 'package:playground/model/dish.dart';

class DishTile extends StatelessWidget {
  final Dish dish;
  const DishTile(
      {super.key, required this.dish});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 200,
        height: 300,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(20)),
        child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(padding: const EdgeInsets.all(10), child: Image.asset(dish.url)),
                const SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(dish.name,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20)),
                        Text(
                          "\$${dish.price}",
                          style: const TextStyle(
                            color: Colors.grey,
                          ),
                        )
                      ],
                    ),
                    Row(children: [
                      Text(dish.star.toString(), 
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                      ),),
                      const Icon(Icons.star, color: Colors.yellow,)
                    ],)
                  ],
                ),
              ],
            )));
  }
}
