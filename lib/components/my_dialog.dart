import 'package:flutter/material.dart';
import 'package:restaurant/routes/rout_list.dart';

// ignore: must_be_immutable
class MyDialog extends StatelessWidget {
  String description = "Hello";
  MyDialog({super.key, this.description = "Hello"});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        Text(description),
        ElevatedButton(
            onPressed: () {
              Navigator.popAndPushNamed(context, '/$home');
            },
            child: const Text("ok"))
      ]),
    );
  }
}
