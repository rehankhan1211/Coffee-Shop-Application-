import 'package:flutter/material.dart';
import 'coffee.dart';

class CoffeeShop extends ChangeNotifier {
  // Coffee For Sale List
  final List<Coffee> _shop = [
    // black coffee
    Coffee(
      name: 'Dark Black',
      price: "90",
      imagePath: "lib/images/black.png",
    ),

    // Espresso
    Coffee(
      name: 'Espresso',
      price: "60",
      imagePath: "lib/images/espresso.png",
    ),

    //iced_coffee
    Coffee(
      name: 'iced_coffee',
      price: "150",
      imagePath: "lib/images/iced_coffee.png",
    ),

    // latte
    Coffee(
      name: 'latte',
      price: "190",
      imagePath: "lib/images/latte.png",
    ),
  ];

  // user cart
  List<Coffee> _userCart = [];

  // get coffee list
  List<Coffee> get coffeeShop => _shop;

  //get user cart
  List<Coffee> get usercart => _userCart;

// add item to cart
  void addItemToCart(Coffee coffee) {
    _userCart.add(coffee);
    notifyListeners();
  }

// remove item from cart
  void removeItemFromCart(Coffee coffee) {
    _userCart.remove(coffee);
    notifyListeners();
  }
}
