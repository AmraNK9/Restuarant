import 'package:flutter/material.dart';
import 'package:restaurant/components/button.dart';
import 'package:restaurant/routes/rout_list.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 135, 60, 55),
        body: Padding(
            padding: const EdgeInsets.all(25),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text("SUSHIMAN",
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                  const SizedBox(height: 25),
                  Padding(
                    padding: const EdgeInsets.all(50),
                    child: Image.asset("lib/images/sushi.png"),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  const Text("THE TASE OF JAPANESE FOOD",
                      style: TextStyle(fontSize: 42, color: Colors.white)),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Feel the taste of the most popular Japanese food from anywhere",
                    style: TextStyle(color: Colors.grey[300], height: 2),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  MyButton(
                      onTap: () => Navigator.pushNamed(context, "/$home"),
                      text: "Get Started")
                ])),
      ),
    );
  }
}
