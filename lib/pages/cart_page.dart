import 'package:flutter/material.dart';
import 'package:playground/model/cart.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
        builder: (context, value, child) => Scaffold(
            appBar: AppBar(
              title: const Text("Check out your cart"),
              backgroundColor: Colors.transparent,
            ),
            body: Column(
              children: [
                Text("Your total bill is ${value.calculatePrice()}\$",
                style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),),
                const SizedBox(height: 20),
                Expanded(
                  child: ListView.builder(
                      itemCount: value.userCart.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Card(
                          child: ListTile(
                            leading: Image.asset(value.userCart[index].url),
                            title: Text(
                                "${value.userCart[index].name} x${value.quantities[index]}"),
                          ),
                        );
                      }),
                ),
              ],
            )));
  }
}
