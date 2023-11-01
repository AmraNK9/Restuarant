import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant/models/shop.dart';
import 'package:restaurant/pages/intro_page.dart';
import 'package:restaurant/routes/routes.dart';
import 'package:restaurant/thame/colors.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => Shop(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(backgroundColor: primaryColor))),
      debugShowCheckedModeBanner: false,
      home: const IntroPage(),
      onGenerateRoute: (settings) => Routegenerator.generateRoute(settings),
    );
  }
}
