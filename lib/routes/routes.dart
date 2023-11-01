import 'package:flutter/material.dart';
import 'package:restaurant/pages/cart_page.dart';
import 'package:restaurant/pages/detail_page.dart';
import 'package:restaurant/pages/intro_page.dart';
import 'package:restaurant/pages/menu_page.dart';
import 'package:restaurant/routes/rout_list.dart';

class Routegenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final dynamic arg = settings.arguments;
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (context) => const IntroPage(),
        );
      case '/$home':
        return MaterialPageRoute(
          builder: (context) => const MenuPage(),
        );
      case '/details':
        return MaterialPageRoute(
          builder: (context) => DetailPage(food: arg),
        );
      case '/cart':
        return MaterialPageRoute(builder: (context) => const CartPage());
      default:
        return MaterialPageRoute(builder: (context) => const IntroPage());
    }
  }
}
