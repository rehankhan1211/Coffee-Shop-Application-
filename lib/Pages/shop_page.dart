import 'package:coffee_app/component/coffee_tile.dart';
import 'package:coffee_app/models/coffee_shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/coffee.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  // add coffee to cart
  void addToCart(Coffee coffee)
  {
    // add to cart
    Provider.of<CoffeeShop>(context, listen: false).addItemToCart(coffee);

    // let user know it add been successfully added
    showDialog(context: context, builder:(context) => AlertDialog(title: Text("Successfully added to cart"),
    ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CoffeeShop>(
      builder: (context, value, child) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              // Heading Message
              const Text(
                "Customize The Coffee To Your Taste?",
                style: TextStyle(fontSize: 25),
              ),

              const SizedBox(height: 25),

              //list of coffee to buy today
              Expanded(
                child: ListView.builder(
                    itemCount: value.coffeeShop.length,
                    itemBuilder: (context, index) {
                      // get individual Coffee
                      Coffee eachCoffee = value.coffeeShop[index];

                      // return the title for this coffee
                      return CoffeeTile(
                        coffee: eachCoffee,
                        icon: const Icon(Icons.add),
                        onPressed: () => addToCart(eachCoffee),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
