import 'package:flutter/material.dart';
import 'list.dart';
import 'profile.dart';
import 'home.dart';

class AppPage extends StatefulWidget {
  const AppPage({Key? key}): super(key: key);
  @override
  State<AppPage> createState() => _AppPageState();
}

class _AppPageState extends State<AppPage> {
  int _currentIndex = 0;

  String setTitle(String name, String gender) {
    if(_currentIndex == 0) {
      if(gender == 'F') {
        return 'Bem vinda, $name';
      } else {
        return 'Bem vindo, $name';
      }
    } else if(_currentIndex == 1) {
      return "List";
    } else {
      return "About profile";
    }
  }

  @override
  Widget build(BuildContext context) {
    List args = ModalRoute.of(context)?.settings.arguments as List;
    String name = args[0] as String;
    String gender = args[2] as String;

    return Scaffold(
      appBar: AppBar(
        title: Text(setTitle(name, gender), style: const TextStyle(fontSize: 26)),
      ),
      body: IndexedStack(index: _currentIndex, children: const [
        HomePage(), ListPage(), ProfilePage()
      ]),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        items: const <BottomNavigationBarItem> [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'List',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}