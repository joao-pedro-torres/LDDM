import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);
  @override
  State<ProfilePage> createState() => _ProfilePage();
}

class _ProfilePage extends State<ProfilePage> {
  String _nameSaved = '';
  String _phoneSaved = '';
  String _emailSaved = '';
  String _psswdSaved = '';
  String _genderSaved = '';

  _getData() async {
    final prefs = await SharedPreferences.getInstance();
    _nameSaved = prefs.getString('name') ?? '';
    _phoneSaved = prefs.getString('phone') ?? '';
    _emailSaved = prefs.getString('email') ?? '';
    _psswdSaved = prefs.getString('psswd') ?? '';
    _genderSaved = prefs.getString('gender') ?? '';
    print('getData: [name: $_nameSaved], [phone: $_phoneSaved], '
        '[email: $_emailSaved], [psswd: $_psswdSaved], [gender: $_genderSaved]');
  }

  _remData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('name');
    await prefs.remove('phone');
    await prefs.remove('email');
    await prefs.remove('psswd');
    await prefs.remove('gender');
    print('getData: [name: $_nameSaved], [phone: $_phoneSaved], '
        '[email: $_emailSaved], [psswd: $_psswdSaved], [gender: $_genderSaved]');
  }

  @override
  Widget build(BuildContext context) {
    List args = ModalRoute.of(context)?.settings.arguments as List;
    String name = args[0] as String;
    String email = args[1] as String;
    String gender = args[2] as String;
    String phone = args[3] as String;
    String psswd = args[4] as String;

    return Scaffold(
      body: Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('name: $name', style: const TextStyle(fontSize: 20)),
          Text('email: $email', style: const TextStyle(fontSize: 20)),
          Text('phone: $phone', style: const TextStyle(fontSize: 20)),
          Text('gender: $gender', style: const TextStyle(fontSize: 20)),
          Text('password: $psswd', style: const TextStyle(fontSize: 20)),
          const SizedBox(height: 50),
          ElevatedButton(
              onPressed: () {_remData(); Navigator.pop(context);},
              child: const Text('Forget profile', style: TextStyle(fontSize: 18)))
        ]
      )),
    );
  }
}