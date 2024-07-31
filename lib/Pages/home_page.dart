import 'package:coffee_app/Pages/cart_page.dart';
import 'package:coffee_app/Pages/const.dart';
import 'package:coffee_app/Pages/shop_page.dart';
import 'package:coffee_app/component/bottom_nav_bar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

  class _HomePageState extends State<HomePage> {
// navigate Bottom Bar
  int _selectedIndex = 0;
  void navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

 //pages
  final List<Widget> _pages = [
    // Shop Page
    const ShopPage(),

    // Cart Page
    const CartPage(),
  ];
     @override
    Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      bottomNavigationBar: MyBottomNavBar(
        onTabChange: (index) => navigateBottomBar(index),
      ),
      body: _pages[_selectedIndex],
     );
    }
  }  
      
