import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shopping/account_root.dart';
import 'package:shopping/cart_root.dart';
import 'package:shopping/fav_root.dart';
import 'package:shopping/home_root.dart';

class ScreenHome extends StatefulWidget {
  ScreenHome({super.key});

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    

    final pages_bottom = [
      ScreenHomeRoot(),
      ScreenCartroot(),
      ScreenFavRoot(),
      ScreenAccountRoot(),
    ];

    return Scaffold(
      body: pages_bottom[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          selectedIconTheme: const IconThemeData(color: Color(0xFFf67951)),
          unselectedIconTheme: const IconThemeData(color: Color(0XFF989898)),
          showSelectedLabels: false,
          showUnselectedLabels: false,
          currentIndex: currentIndex,
          onTap: (value) {
            setState(() {
              currentIndex = value;
            });
          },
          items: const [
            BottomNavigationBarItem(label: "Home", icon: Icon(Icons.home)),
            BottomNavigationBarItem(
                label: "Cart", icon: Icon(Icons.shopping_cart_checkout)),
            BottomNavigationBarItem(
                label: "Favorite", icon: Icon(Icons.favorite)),
            BottomNavigationBarItem(
                label: "Account", icon: Icon(Icons.account_circle)),
          ]),
    );
  }
}
