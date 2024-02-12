import 'package:flutter/material.dart';
import '../Home/HomeApp.dart';

class LoginRep extends StatefulWidget {
  const LoginRep({Key? key}) : super(key: key);

  @override
  State<LoginRep> createState() => _LoginRepState();
}

class _LoginRepState extends State<LoginRep> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String login = '';
  String senha = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: const Key('loginScreen'),
      backgroundColor: Colors.deepPurple,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  onChanged: (text) {
                    setState(() {
                      login = text;
                    });
                  },
                  autofocus: true,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                  decoration: const InputDecoration(
                    labelText: "Login",
                    labelStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                TextFormField(
                  onChanged: (text) {
                    setState(() {
                      senha = text;
                    });
                  },
                  autofocus: true,
                  obscureText: true,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                  decoration: const InputDecoration(
                    labelText: "Senha",
                    labelStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                ButtonTheme(
                  minWidth: 220.0,
                  height: 60.0,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState?.validate() ?? false) {
                        if (login == 'Bruno' && senha == '123') {
                          // ignore: avoid_print
                          print('Login correto. Navegando para HomeApp.');
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomeApp(
                                    login: 'Bruno', senha: '123')),
                          );
                        } else {
                          // ignore: avoid_print
                          print('Login inválido');
                        }
                      }
                    },
                    child: const Text(
                      "ENTRAR",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(220.0, 60.0),
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
