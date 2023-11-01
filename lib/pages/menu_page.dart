import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant/components/button.dart';
import 'package:restaurant/components/food_tile.dart';
import 'package:restaurant/models/food.dart';
import 'package:restaurant/models/shop.dart';
import 'package:restaurant/routes/rout_list.dart';
import 'package:restaurant/thame/colors.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({Key? key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  // ignore: non_constant_identifier_names
  void NavigateToDetail(Food food) {
    Navigator.pushNamed(context, '/$detail', arguments: food);
  }

  @override
  Widget build(BuildContext context) {
    final shop = context.read<Shop>();
    final foodList = shop.foodList;
    return Scaffold(
      drawer: Drawer(
          backgroundColor: backgroundColor,
          child: ListView(
            children: [
              SizedBox(
                  child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Image.asset("lib/images/sushi.png"))),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: ListTile(
                  title: const Text("about"),
                  leading: Icon(
                    Icons.person,
                    color: Colors.grey[900],
                  ),
                ),
              )
            ],
          )),
      backgroundColor: backgroundColor,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.grey[900]), //add this line here
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, "/$cart");
            },
            icon: const Icon(Icons.add_shopping_cart),
            color: Colors.grey[900],
          )
        ],
        // leading: Icon(
        //   Icons.menu,
        //   color: Colors.grey[900],
        // ),
        title: Text(
          "ToKyo",
          style: TextStyle(
            color: Colors.grey[900],
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //promo banner
          Container(
            margin: const EdgeInsets.all(20),
            padding: const EdgeInsets.all(10),
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), color: primaryColor),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("20% off",
                        style: TextStyle(fontSize: 20, color: Colors.white)),
                    const SizedBox(
                      height: 10,
                    ),
                    MyButton(
                        text: "Redeem",
                        onTap: () {
                          Navigator.pushNamed(context, "/$detail",
                              arguments: foodList[4]);
                        }),
                  ],
                ),
                const SizedBox(
                  height: 10,
                  width: 25,
                ),
                Image.asset(
                  "lib/images/sushi2.png",
                  height: 115,
                ),
              ],
            ),
          ),
          //search bar
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
              autofocus: false,
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(color: Colors.white),
                ),
                hintText: "Hello...",
                suffixIcon: IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {},
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(color: Colors.white),
                ),
              ),
            ),
          ),
          //popular food
          const SizedBox(
            height: 10,
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Text(
              "Food Menu",
              style: TextStyle(
                fontSize: 25,
                color: Colors.grey[900],
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          SizedBox(
            height: 190,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: foodList.length,
                itemBuilder: (context, index) {
                  Food? food = foodList[index];
                  return GestureDetector(
                    onTap: () {
                      NavigateToDetail(food);
                    },
                    child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: FoodTile(
                          food: food,
                        )),
                  );
                },
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, "/$detail", arguments: foodList[0]);
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.grey[100],
              ),
              margin: const EdgeInsets.all(20),
              child: SizedBox(
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: ListTile(
                    leading: Image.asset(
                      foodList[0].imagePatch,
                      height: 120,
                    ),
                    title: Text(foodList[0].name),
                    subtitle: Text("\$${foodList[0].price}"),
                    trailing: SizedBox(
                      child: Column(children: [
                        const SizedBox(
                          height: 10,
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.yellow[700],
                        ),
                        Text(foodList[0].rating)
                      ]),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
