import 'package:coffee_app/component/coffee_tile.dart';
import 'package:coffee_app/models/coffee.dart';
import 'package:coffee_app/models/coffee_shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {

  //remove item from cart
  void removeFromCart(Coffee coffee)
  {
    Provider.of<CoffeeShop>(context,listen: false).removeItemFromCart(coffee);
  }

  // pay button tapped
  void payNow()
  {
    /*

    fill out ur payment services
    */
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<CoffeeShop>(
      builder: (context, value, child) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              // Heading
              const Text(
                'Your Cart',
                style: TextStyle(fontSize: 20),
              ),

              // List of cart items
              Expanded(
                child: ListView.builder(itemCount: value.usercart.length,itemBuilder: (context, index) {
                  // get individual cart items
                  Coffee eachCoffee = value.usercart [index];
                  
                  //return coffee tile
                  return CoffeeTile(coffee: eachCoffee,onPressed: () => removeFromCart(eachCoffee), icon: Icon(Icons.delete),
                  );
                },
                ),
              ),

              // pay button
              GestureDetector(
                onTap: payNow,
                child: Container(
                padding: const EdgeInsets.all(25),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.brown,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Center(
                  child: Text(
                    "Pay Now",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
