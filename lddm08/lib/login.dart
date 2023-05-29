import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}): super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _psswd = TextEditingController();
  bool? _rememberMe = false;
  bool _hidden = false;

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: Container(
            width: double.infinity,
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

                        _getData();
                        if(_emailSaved == "" || _nameSaved == "" ||
                            _phoneSaved == "" || _psswdSaved == "") {
                          showDialog<String>(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              title: const Text(
                                  'Erro ao resgatar dados de cadastro.'),
                              content: const Text(
                                  'Cadastro não realizado ou realizado '
                                      'incorretamente.'),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: const Text('Fechar'),
                                ),
                              ],
                            ),
                          );
                        } else if(_email.text != _emailSaved
                            || _psswd.text != _psswdSaved) {
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
                              context, '/app',
                              arguments: [
                                _nameSaved,
                                _emailSaved,
                                _genderSaved,
                                _phoneSaved,
                                _psswdSaved,
                              ]
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