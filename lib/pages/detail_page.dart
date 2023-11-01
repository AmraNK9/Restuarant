import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant/components/button.dart';
import 'package:restaurant/components/my_dialog.dart';
import 'package:restaurant/models/food.dart';
import 'package:restaurant/models/shop.dart';
import 'package:restaurant/thame/colors.dart';

class DetailPage extends StatefulWidget {
  final Food food;
  const DetailPage({super.key, required this.food});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int count = 0;
  // ignore: non_constant_identifier_names
  void Add() {
    setState(() {
      count++;
    });
  }

  // ignore: non_constant_identifier_names
  void Remove() {
    setState(() {
      count--;
    });
  }

  void addToCart() {
    final shop = context.read<Shop>();
    shop.addToCart(widget.food, count);
    showDialog(
      context: context,
      builder: (context) => Dialog(
        child: MyDialog(description: "successfully added"),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: primaryColor,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          widget.food.name,
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(25),
              child: ListView(
                children: [
                  SizedBox(
                      height: 200,
                      child: Image(image: AssetImage(widget.food.imagePatch))),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    widget.food.name,
                    style: const TextStyle(
                        fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("\$${widget.food.price}"),
                      SizedBox(
                          child: Row(children: [
                        const Icon(
                          Icons.star,
                          color: Colors.yellow,
                        ),
                        Text(widget.food.rating),
                        const SizedBox(
                          height: 20,
                        ),
                      ]))
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Sushi: A Bite of Japan's Culinary Delight If you're a foodie like me, you've probably come across sushi at some point in your culinary adventures. This Japanese delicacy has gained popularity worldwide, and for good reason! Let me give you a quick rundown on what makes sushi so special.At its core, sushi is a combination of vinegared rice and various ingredients, typically seafood, vegetables, or even fruits. It may sound simple, but the art lies in the skillful preparation and presentation. Traditional sushi is handmade by skilled sushi chefs who have honed their craft over years of practice.One of the most recognizable forms of sushi is the maki roll. This is where the magic happens! A sheet of seaweed, called nori, is layered with rice and filled with a variety of ingredients. From the classic California roll with crab meat, avocado, and cucumber, to more adventurous combinations like spicy tuna or tempura shrimp, there's a maki roll to suit every palate.If you prefer something more refined, nigiri sushi might be your go-to. This style features a small mound of rice topped with a slice of fresh fish or seafood. The simplicity allows you to truly appreciate the flavors and textures of the ingredients. Each bite is a burst of umami goodness!Now, let's not forget about sashimi. While not technically sushi, it's often served alongside it. Sashimi is thinly sliced raw fish or seafood, served without rice. It's all about the purity of the ingredient, so freshness is key. Dip it in a little soy sauce and wasabi, and you're in for a treat!Whether you're a sushi aficionado or a newbie, there's something for everyone to enjoy. Sushi is not only a feast for the taste buds but also a visual delight. The vibrant colors, meticulous presentation, and attention to detail make it a true work of art.So, the next time you're craving a culinary adventure, why not give sushi a try? You'll be transported to Japan with every bite, experiencing a taste of their rich culinary heritage. Trust me, once you've had a taste, you'll be hooked!",
                    style: TextStyle(color: Colors.grey[600], height: 2),
                  )
                ],
              ),
            ),
          ),
          Container(
            width: double.infinity,
            color: primaryColor,
            child: Padding(
              padding: const EdgeInsets.all(25),
              child: Column(
                children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "\$${int.parse(widget.food.price) * count}",
                          style: const TextStyle(color: Colors.white),
                        ),
                        SizedBox(
                          width: 150,
                          child: Row(children: [
                            GestureDetector(
                              onTap: Add,
                              child: Container(
                                  width: 50,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: secondaryColor,
                                  ),
                                  child: const Icon(
                                    Icons.add,
                                    color: Colors.white,
                                  )),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              count.toString(),
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 20),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            GestureDetector(
                              onTap: Remove,
                              child: Container(
                                  width: 50,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: secondaryColor,
                                  ),
                                  child: const Icon(
                                    Icons.remove,
                                    color: Colors.white,
                                  )),
                            ),
                          ]),
                        )
                      ]),
                  const SizedBox(
                    height: 20,
                  ),
                  MyButton(
                    text: "Add to Cart",
                    onTap: addToCart,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
