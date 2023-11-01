import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant/components/button.dart';
import 'package:restaurant/components/my_dialog.dart';
import 'package:restaurant/models/food.dart';
import 'package:restaurant/models/shop.dart';
import 'package:restaurant/thame/colors.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  int total = 0;
  @override
  void initState() {
    final shop = context.read<Shop>();
    // ignore: non_constant_identifier_names
    final cartList = shop.cart;
    for (var element in cartList) {
      total += int.parse(element.price);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Expanded(
              child: Padding(padding: EdgeInsets.all(20), child: CartList())),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(color: primaryColor),
            padding: const EdgeInsets.all(20),
            child: Column(children: [
              Text(
                "\$$total",
                style: const TextStyle(fontSize: 20, color: Colors.white),
              ),
              const SizedBox(
                height: 20,
              ),
              MyButton(
                  text: "Pay Now",
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => Dialog(
                        child: MyDialog(description: "Payment Success"),
                      ),
                    );
                  })
            ]),
          )
        ],
      ),
      appBar: AppBar(
          backgroundColor: primaryColor,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          )),
    );
  }
}

class CartList extends StatefulWidget {
  const CartList({super.key});

  @override
  State<CartList> createState() => _CartListState();
}

class _CartListState extends State<CartList> {
  @override
  Widget build(BuildContext context) {
    final shop = context.read<Shop>();
    List<Food> cartList = shop.cart;

    return ListView.builder(
      itemCount: cartList.length,
      itemBuilder: (context, index) {
        Food food = cartList[index];
        return Card(
          child: ListTile(
            subtitle: Text("\$${food.price}"),
            leading: Image.asset(
              food.imagePatch,
              height: 30,
            ),
            title: Text(food.name),
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
                setState(() {
                  shop.removeFromCart(food);
                });
              },
            ),
          ),
        );
      },
    );
  }
}
