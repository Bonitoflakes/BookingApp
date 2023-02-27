import 'package:booking_app/home_page.dart';
import 'package:booking_app/register_page.dart';
import 'package:booking_app/utils/app_styles.dart';
import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  static final _widgetOptions = [
    const HomePage(),
    const RegisterPage(),
    const Text('Tickets'),
    const Text('Profile'),
  ];

  static final _appBarTitle = [
    const Text(''),
    const Text('Register Page', style: TextStyle(color: Colors.blueGrey)),
    const Text(''),
    const Text(''),
  ];

  int _currentIndex = 0;

  void setCurrentIndex(int value) {
    setState(() {
      _currentIndex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Styles.bgColor,
          elevation: 0,
          title: _appBarTitle[_currentIndex],
        ),
        body: _widgetOptions[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
                icon: Icon(FluentSystemIcons.ic_fluent_home_regular),
                activeIcon: Icon(FluentSystemIcons.ic_fluent_home_filled),
                label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(FluentSystemIcons.ic_fluent_search_regular),
                activeIcon: Icon(FluentSystemIcons.ic_fluent_search_filled),
                label: 'Search'),
            BottomNavigationBarItem(
                icon: Icon(FluentSystemIcons.ic_fluent_ticket_regular),
                activeIcon: Icon(FluentSystemIcons.ic_fluent_ticket_filled),
                label: 'Tickets'),
            BottomNavigationBarItem(
                icon: Icon(FluentSystemIcons.ic_fluent_person_regular),
                activeIcon: Icon(FluentSystemIcons.ic_fluent_person_filled),
                label: 'Profile'),
          ],
          showSelectedLabels: false,
          showUnselectedLabels: false,
          enableFeedback: true,
          selectedItemColor: Styles.primaryColor,
          unselectedItemColor: Colors.blueGrey,
          elevation: 10,
          currentIndex: _currentIndex,
          onTap: setCurrentIndex,
          type: BottomNavigationBarType.fixed,
        ),
      ),
    );
  }
}
