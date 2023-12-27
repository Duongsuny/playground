import 'package:flutter/material.dart';
import 'package:playground/components/shoetile.dart';
import 'package:playground/entities/cart.dart';
import 'package:playground/entities/shoe.dart';
import 'package:playground/pages/cart.dart';

class Shop extends StatelessWidget {
  const Shop({super.key});

  @override
  Widget build(BuildContext context) {
    List<Shoe> shoes = [
      Shoe(
          name: "Air Jordan",
          price: 120,
          description: "Newest Models",
          path: "lib/assets/AirJordan.jpg"),
      Shoe(
          name: "Ananas",
          price: 150,
          description: "Vietnamese shoes",
          path: "lib/assets/Ananas.jpeg")
    ];

    //User cart

    UserCart userCart = UserCart();
    void addThisShoe(Shoe shoe) {
      userCart.addShoe(shoe);
      print(userCart.shoesAdded);
      showDialog(context: context, 
      builder: (context) {
        return AlertDialog(
          title: const Text("Successfully added shoes"),
          content: Text("You have added ${shoe.name} to your cart")
        );
      });
    }

    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(8)),
            padding: const EdgeInsets.all(15),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Search",
                  style: TextStyle(color: Colors.grey),
                ),
                Icon(Icons.search),
              ],
            ),
          ),
          const SizedBox(height: 30),
          const Text(
            "Our shoes are specially made in a remote region of Northern Vietnam",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: shoes.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: ShoeTile(shoe: shoes[index], addShoe: () => addThisShoe(shoes[index]),),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
