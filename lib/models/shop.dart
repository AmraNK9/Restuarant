import 'package:flutter/material.dart';
import 'package:restaurant/models/food.dart';

class Shop extends ChangeNotifier {
  final List<Food> foodList = [
    Food(
        name: "NagaShi",
        price: "3200",
        rating: "4.5",
        imagePatch: "lib/images/sushi3.png"),
    Food(
        name: "Danck sushi",
        price: "4300",
        imagePatch: "lib/images/sushi4.png",
        rating: "5.3"),
    Food(
        name: "Night Sushi",
        price: "5600",
        imagePatch: "lib/images/sushi5.png",
        rating: "7.6"),
    Food(
        name: "sun hot",
        price: "3150",
        rating: "4.5",
        imagePatch: "lib/images/sushi.png"),
    Food(
        name: "mid lanch",
        price: "3900",
        rating: "4.5",
        imagePatch: "lib/images/sushi2.png"),
  ];
  List<Food> cartList = [];

  List<Food> get food => foodList;
  List<Food> get cart => cartList;

  void addToCart(Food foodItem, int quantity) {
    for (int i = 0; i < quantity; i++) {
      cartList.add(foodItem);
      notifyListeners();
    }
  }

  void removeFromCart(Food foodItem) {
    cartList.remove(foodItem);
    notifyListeners();
  }
}
