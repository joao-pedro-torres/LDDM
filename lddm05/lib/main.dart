import 'package:flutter/material.dart';
import 'register.dart';

void main() => runApp(const HomePage());

class HomePage extends StatefulWidget {
  const HomePage({Key? key}): super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _psswd = TextEditingController();
  bool? _rememberMe = false;
  bool _hidden = false;

  @override
  void initState() => _hidden = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Home Page',
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Login', style: TextStyle(fontSize: 26)),
          ),
          drawer: const Drawer(),

          body: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/background-R.jpg'),
                fit: BoxFit.cover,
              ),
            ),

            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Email
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(50, 0, 50, 0),
                    child: TextField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          labelText: 'E-mail',
                          contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 0)
                      ),
                      style: const TextStyle(fontSize: 18),
                      enabled: true,
                      controller: _email,
                    ),
                  ),

                  // Password
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(50, 0, 50, 0),
                    child: TextField(
                      keyboardType: TextInputType.text,
                      obscureText: !_hidden,
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          labelText: 'Password',
                          contentPadding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                          suffixIcon: IconButton(
                              onPressed: () {
                                setState(() => _hidden = !_hidden);
                              },
                              icon: Icon(
                                  _hidden ?
                                  Icons.visibility :
                                  Icons.visibility_off
                                )
                          )
                      ),
                      style: const TextStyle(fontSize: 18),
                      enabled: true,
                      controller: _psswd,
                    ),
                  ),

                  // Remember me
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget> [
                      const Text('Remember me', style: TextStyle(fontSize: 16)),
                      Checkbox(value: _rememberMe, onChanged: (bool? state) {
                            setState(() => _rememberMe = state);
                      })
                    ],
                  ),

                  // Enter
                  const SizedBox(height: 10),
                  SizedBox(
                    width: 80, height: 40,
                    child: ElevatedButton(
                      onPressed: () {
                        if(_rememberMe == true)
                          print("email: ${_email.text}\tpsswd: ${_psswd.text}");
                      },
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
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget> [
                      const Text('New here?',
                          style: TextStyle(
                            fontSize: 15,
                          )
                      ),
                      TextButton(
                        child: const Text('Create an account!',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Colors.blue
                          )
                        ),
                        onPressed: () {}
                      ),
                    ],
                  ),
                ]
            ),
          ),

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
        )
    );
  }
}
