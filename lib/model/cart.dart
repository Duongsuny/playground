import "package:flutter/material.dart";
import "package:playground/model/dish.dart";

class Cart extends ChangeNotifier {


  List<Dish> userCart = [];
  List<int> quantities = [];

  void addToCart(Dish dish, int quantity) {
    userCart.add(dish);
    quantities.add(quantity);
    notifyListeners();
  }

  int calculatePrice () {
    int price = 0;
    for(int i = 0; i < userCart.length; i++) {
      price += userCart[i].price * quantities[i];
    }
    return price;
  }
}