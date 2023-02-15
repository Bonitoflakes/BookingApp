import 'package:booking_app/bottom_bar.dart';
import 'package:booking_app/home_page.dart';
import 'package:booking_app/utils/app_styles.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Styles.bgColor,
          elevation: 0,
        ),
        body: HomePage(),
        bottomNavigationBar: const BottomBar(),
      ),
    );
  }
}
