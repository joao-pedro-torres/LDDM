import 'package:flutter/material.dart';
import 'login.dart';
import 'about.dart';
import 'register.dart';
import 'home.dart';

import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}): super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  String _title = "Login";
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title, style: const TextStyle(fontSize: 26)),
      ),
      drawer: const Drawer(),

      body: IndexedStack(index: _currentIndex, children: const [
        LoginPage(), AboutPage()
      ]),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() {
          _currentIndex = index;

          if(_currentIndex == 0) {
            _title = "Login";
          } else {
            _title = "About";
          }
        }),
        items: const <BottomNavigationBarItem> [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.question_mark_sharp),
            label: 'About',
          ),
        ],
      ),
    );
  }
}

void main() => runApp(MaterialApp(
  initialRoute: '/main',
  routes: {
    '/main': (context) => const MainPage(),
    '/login': (context) => const LoginPage(),
    '/register': (context) => const RegisterPage(),
    '/home': (context) => const HomePage(),
  },
));