import 'package:flutter/material.dart';

void main() => runApp(const HomePage());

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        home: Scaffold(
          body: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/background.jpg'),
                fit: BoxFit.cover,
              ),
            ),

            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Email
                  const SizedBox(height: 10),
                  Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(3)),
                      color: Colors.white,
                    ),
                    padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                    width: 320, height: 51,
                    child: const TextField(
                      decoration: InputDecoration(
                          labelText: 'E-mail',
                          contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 0)
                      ),
                      style: TextStyle(fontSize: 18),
                    ),
                  ),

                  // Password
                  const SizedBox(height: 10),
                  Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(3)),
                      color: Colors.white,
                    ),
                    padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                    width: 320, height: 51,
                    child: const TextField(
                      decoration: InputDecoration(
                          labelText: 'Password',
                          contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 0)
                      ),
                      style: TextStyle(fontSize: 18),
                    ),
                  ),

                  // Enter
                  const SizedBox(height: 10),
                  SizedBox(
                    width: 80, height: 40,
                    child: ElevatedButton(
                      onPressed: null,
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.blue),
                      ),
                      child: const Text('Enter',style: TextStyle(
                          color: Colors.white,
                          fontSize: 18),
                      ),
                    ),
                  ),

                  // create account
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text('New here? ',
                          style: TextStyle(
                            fontSize: 15,
                          )
                      ),
                      Text(' Create an account!',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Colors.blue
                          )
                      ),
                    ],
                  ),
                ]
            ),
          ),
          // top bar
          appBar: AppBar(
            title: const Text('Login', style: TextStyle(fontSize: 26)),
          ),
          // bottom bar
          bottomNavigationBar: BottomNavigationBar(
            items: const <BottomNavigationBarItem> [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'My Account',
              ),
            ],
          ),
          // menu side folded bar
          drawer: const Drawer(),
        )
    );
  }
}