import 'package:flutter/material.dart';
import 'login.dart';
import 'register.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
          child: ElevatedButton(
              child: const Text('Log in'),
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const LoginPage())
              ),
          ),

    );
  }
}