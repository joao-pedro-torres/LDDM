import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}): super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    List args = ModalRoute.of(context)?.settings.arguments as List;
    String name = args[0] as String;
    String gender = args[2] as String;

    String getTitle(String name, String gender) {
      if(gender == 'F') {
        return 'Bem vinda, $name';
      } else {
        return 'Bem vindo, $name';
      }
    }

    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background-home.jpg'),
            fit: BoxFit.cover,
          ),
        ),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(getTitle(name, gender), style: const TextStyle(
              fontSize: 70, color: Colors.white, fontWeight: FontWeight.bold,
            ), textAlign: TextAlign.center)
          ],
        )
      )
    );
  }
}