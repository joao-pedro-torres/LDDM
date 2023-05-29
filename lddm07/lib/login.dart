import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}): super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _psswd = TextEditingController();
  final TextEditingController _name = TextEditingController();
  bool? _rememberMe = false;
  bool _hidden = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          drawer: const Drawer(),

          body: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/background-R.jpg'),
                fit: BoxFit.cover,
              ),
            ),

            child: ListView(
              children: [
              const SizedBox(height: 110),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Name
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(50, 0, 50, 0),
                    child: TextField(
                      keyboardType: TextInputType.name,
                      decoration: const InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          labelText: 'Name',
                          contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 0)
                      ),
                      style: const TextStyle(fontSize: 18),
                      enabled: true,
                      controller: _name,
                    ),
                  ),

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
                        if(_rememberMe == true) {
                          print("email: ${_email.text}\tpsswd: ${_psswd.text}");
                        }

                        if(_email.text != 'eu@gmail.com'
                            || _psswd.text != '1234') {
                          showDialog<String>(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              title: const Text('Dados inválidos!'),
                              content: const Text('Usuário e/ou senha incorretos.'),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: const Text('Fechar'),
                                ),
                              ],
                            ),
                          );
                        } else {
                          Navigator.pushNamed(
                              context, '/home',
                              arguments: _name.text
                          );
                        }
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
                          onPressed: () {
                            Navigator.pushNamed(context, '/register');
                          }
                      ),
                    ],
                  ),
                ]
            )]),
          ),
        );
  }
}