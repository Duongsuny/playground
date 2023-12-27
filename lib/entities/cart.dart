import 'package:playground/entities/shoe.dart';

class UserCart {
  List<Shoe> shoesAdded = [];

  void addShoe(Shoe shoe) {
    shoesAdded.add(shoe);
  }

  List<Shoe> printCart() {
    return(shoesAdded);
  }
}
