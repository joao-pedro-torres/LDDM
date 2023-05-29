import 'dart:ffi';

import 'package:flutter/material.dart';
import 'home.dart';
import 'about.dart';

void main() => runApp(const MainPage());

class MainPage extends StatefulWidget {
  const MainPage({Key? key}): super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Scaffold(
      body: IndexedStack(index: _currentIndex, children: const [
        HomePage(), AboutPage()
      ]),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_balance),
              label: 'About',
            ),
          ],
          onTap: (index) => setState(() => _currentIndex = index),
      )
    ),

    );
  }
}