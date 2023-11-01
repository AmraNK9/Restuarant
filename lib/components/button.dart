import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MyButton extends StatelessWidget {
  final String text;
  void Function()? onTap;
  MyButton({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          decoration: const BoxDecoration(
              color: Color.fromARGB(89, 62, 71, 68),
              borderRadius: BorderRadius.all(Radius.circular(25))),
          child: Padding(
              padding: const EdgeInsets.all(20),
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text(
                  text,
                  style: const TextStyle(color: Colors.white),
                ),
                const SizedBox(
                  width: 20,
                ),
                const Icon(
                  Icons.arrow_forward,
                  color: Colors.white,
                )
              ]))),
    );
  }
}
