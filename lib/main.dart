import 'package:flutter/material.dart';
import 'package:testfeflutterordo/screen_page/home_screen.dart';
import 'package:testfeflutterordo/screen_page/nav_bar.dart';
import 'package:testfeflutterordo/widget/carousel_slider.dart';
import 'package:testfeflutterordo/widget/carousel_slider_fine.dart';
import 'package:testfeflutterordo/widget/menu_card.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: NavBar(),
    );
  }
}
