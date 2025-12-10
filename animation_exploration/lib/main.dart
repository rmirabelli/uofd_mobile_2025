import 'package:animation_exploration/widgets/hero_animation.dart';
import 'package:animation_exploration/widgets/implicit_animation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  int currentTab = 0;
  var screens = [ImplicitAnimation(), HeroAnimation()];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.abc), label: "implicit"),
            BottomNavigationBarItem(icon: Icon(Icons.light), label: "hero"),
          ],
          currentIndex: currentTab,
          selectedItemColor: Colors.blue,
          onTap: (value) {
            setState(() {
              currentTab = value;
            });
          },
        ),
        body: screens[currentTab],
      ),
    );
  }
}
