import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(home: RegisterPage()));

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}): super(key: key);
  @override
  _RegisterPage createState() => _RegisterPage();
}

class _RegisterPage extends State<RegisterPage> {
  final TextEditingController _name = TextEditingController();
  final TextEditingController _date = TextEditingController();
  final TextEditingController _phone = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _psswd = TextEditingController();
  String? _gender = "";
  bool _hidden = false;
  bool _contactEmail = false;
  bool _contactPhone = false;
  double _slider = 0;
  String _sliderLabel = "";
  double? _inputFontSize = 18;
  double? _textFontSize = 16;
  double? _lastFontSize = 14;

  @override
  void initState() => _hidden = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
        appBar: AppBar(
            title: const Text('Register', style: TextStyle(fontSize: 26))
        ),
        drawer: const Drawer(),

        body: ListView(
            semanticChildCount: 1,
            children: <Widget> [ Container(
                decoration: const BoxDecoration(image: DecorationImage(
                    image: AssetImage('assets/images/background-L.jpg'),
                    fit: BoxFit.fill)
                ),

                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget> [
                      // Slider
                      const SizedBox(height: 20),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget> [
                            IconButton(
                                icon: const Icon(Icons.zoom_out),
                                onPressed: () {
                                  if(_slider > 0) {
                                    setState(() {
                                      _slider--;
                                      _inputFontSize = 18 + _slider;
                                      _textFontSize = 16 + _slider;
                                      _lastFontSize = 14 + _slider;
                                      _sliderLabel = "font size:+${_slider.toString()}";
                                    });
                                  }
                                }
                            ),
                            Expanded(child: Slider(
                                value: _slider, min: 0, max: 10,
                                onChanged: (double value) {
                                  setState(() {
                                    _slider = value;
                                    _inputFontSize = 18 + value;
                                    _textFontSize = 16 + value;
                                    _lastFontSize = 14 + value;
                                    _sliderLabel = "font size: +${value.toString()}";
                                  });
                                },
                                divisions: 10, label: _sliderLabel
                            )),
                            IconButton(
                                icon: const Icon(Icons.zoom_in),
                                onPressed: () {
                                  if(_slider < 10) {
                                    setState(() {
                                      _slider++;
                                      _inputFontSize = 18 + _slider;
                                      _textFontSize = 16 + _slider;
                                      _lastFontSize = 14 + _slider;
                                      _sliderLabel = "font size:+${_slider.toString()}";
                                    });
                                  }
                                }
                            ),
                          ]),

                      // Name
                      Padding(
                        padding: const EdgeInsets.fromLTRB(50, 10, 50, 10),
                        child: TextField(
                          keyboardType: TextInputType.text,
                          decoration: const InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              labelText: "Name",
                              contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 0)
                          ),
                          style: TextStyle(fontSize: _inputFontSize),
                          enabled: true,
                          maxLength: 24,
                          controller: _name,
                        ),
                      ),

                      // Date of Birth
                      Padding(
                        padding: const EdgeInsets.only(
                            bottom: 10, left: 50, right: 50
                        ),
                        child: TextField(
                          keyboardType: TextInputType.datetime,
                          decoration: const InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              labelText: "Date of Birth",
                              contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 0)
                          ),
                          style: TextStyle(fontSize: _inputFontSize),
                          enabled: true,
                          maxLength: 10,
                          controller: _date,
                        ),
                      ),

                      // Phone
                      Padding(
                        padding: const EdgeInsets.only(
                            bottom: 10, left: 50, right: 50
                        ),
                        child: TextField(
                          keyboardType: TextInputType.phone,
                          decoration: const InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              labelText: "Phone",
                              contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 0)
                          ),
                          style: TextStyle(fontSize: _inputFontSize),
                          enabled: true,
                          maxLength: 11,
                          controller: _phone,
                        ),
                      ),

                      // Gender
                      Text("Gender: ", style: TextStyle(fontSize: _inputFontSize)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget> [
                          const SizedBox(width: 20),
                          Text("Male", style: TextStyle(fontSize: _textFontSize)),
                          Radio(
                              value: 'male',
                              groupValue: _gender,
                              onChanged: (String? s) => setState(() => _gender = s)
                          ),
                          const SizedBox(width: 50),
                          Text("Female", style: TextStyle(fontSize: _textFontSize)),
                          Radio(
                              value: 'female',
                              groupValue: _gender,
                              onChanged: (String? s) => setState(() => _gender = s)
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),

                      // E-mail
                      Padding(
                        padding: const EdgeInsets.only(
                            bottom: 10, left: 50, right: 50
                        ),
                        child: TextField(
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              labelText: "E-mail",
                              contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 0)
                          ),
                          style: TextStyle(fontSize: _inputFontSize),
                          enabled: true,
                          controller: _email,
                        ),
                      ),

                      // Password
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 5, bottom: 10, left: 50, right: 50
                        ),
                        child: TextField(
                          keyboardType: TextInputType.text,
                          obscureText: !_hidden,
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              labelText: 'Password',
                              contentPadding: const EdgeInsets.fromLTRB(
                                  10, 0, 0, 0
                              ),
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
                          style: TextStyle(fontSize: _inputFontSize),
                          enabled: true,
                          maxLength: 24,
                          controller: _psswd,
                        ),
                      ),

                      // Switch contact
                      const SizedBox(height: 10),
                      SizedBox(
                        width: 320,
                        child: Column(
                          children: <Widget> [
                            Text(
                                "Receive notification by:",
                                style: TextStyle(fontSize: _inputFontSize)
                            ),
                            SwitchListTile(
                                title: Text("E-mail",
                                    style: TextStyle(fontSize: _textFontSize)
                                ),
                                value: _contactEmail,
                                onChanged: (bool value) {
                                  setState(() => _contactEmail = value);
                                }
                            ),
                            SwitchListTile(
                                title: Text("Phone",
                                    style: TextStyle(fontSize: _textFontSize)
                                ),
                                value: _contactPhone,
                                onChanged: (bool value) {
                                  setState(() => _contactPhone = value);
                                }
                            ),
                          ],
                        ),
                      ),

                      // Register
                      Padding(padding: const EdgeInsets.only(bottom: 0),
                          child: SizedBox(
                            width: 150, height: 40,
                            child: ElevatedButton(
                              onPressed: () {
                                print(
                                    "nome: ${_name.text}"+
                                        "\nnasc: ${_date.text}"+
                                        "\nphone: ${_phone.text}"+
                                        "\ngender: ${_gender}"+
                                        "\nemail: ${_email.text}"+
                                        "\npsswd: ${_psswd.text}"+
                                        "\nemail_notif: ${_contactEmail}"+
                                        "\nphone_notif: ${_contactPhone}"
                                );
                              },
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    Colors.blue
                                ),
                              ),
                              child: Text('Register',style: TextStyle(
                                  color: Colors.white,
                                  fontSize: _inputFontSize),
                              ),
                            ),
                          )
                      ),

                      // Already registered
                      Wrap(
                          alignment: WrapAlignment.center,
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: <Widget> [
                            Text("Already have an account?", style: TextStyle(
                                fontSize: _lastFontSize)
                            ),
                            TextButton(
                                onPressed: () {},
                                child: Text("Log in!", style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: _lastFontSize
                                ), overflow: TextOverflow.clip)
                            )
                          ]),

                      const SizedBox(height: 30)
                    ]
                ))
            ]
        ));
  }
}
