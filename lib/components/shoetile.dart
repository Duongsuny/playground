import 'package:flutter/material.dart';
import 'package:playground/entities/shoe.dart';

//This file contains code for each shoe tile

class ShoeTile extends StatelessWidget {
  final Shoe shoe;
  final Function() addShoe;
  const ShoeTile({super.key, required this.shoe, required this.addShoe});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 400,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(12)),
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        //image
        Column(
          children: [
            //image of the shoe
            Image.asset(shoe.path, height: 240),

            //shoe's namee
            Text(
              shoe.name,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            )
          ],
        ),

        //Bottom row contains description, price and add button
        Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween, 
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //Description and price column
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //shoe's description
                Text(
                  shoe.description,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),

                // shoe's price
                Text(
                  '\$${shoe.price.toString()}',
                  style: const TextStyle(
                    fontStyle: FontStyle.italic,
                  ),
                )
              ],
            ),
          ),

          // add button
          GestureDetector(
            onTap: addShoe,
            child: Container(
              width: 50,
              height: 50,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15), bottomRight: Radius.circular(15)),
                color: Colors.black,
              ),
              child: const Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
          )
        ])
        //Button
      ]),
    );
  }
}
