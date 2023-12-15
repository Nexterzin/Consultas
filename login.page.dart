import 'package:flutter/material.dart';
import 'HomeApp.dart';

class LoginRep extends StatefulWidget {
  const LoginRep({Key? key}) : super(key: key);

  @override
  State<LoginRep> createState() => _LoginRepState();
}

class _LoginRepState extends State<LoginRep> {
String login = '';
String senha = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Padding(
          padding: EdgeInsets.all(5),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  onChanged: (text) {
                    login = text;
                  },
                  autofocus: true,
                  style: new TextStyle(
                    color: Colors.black,
                    fontSize: 30
                    ),
                  decoration: InputDecoration(
                      labelText: "Login",
                      labelStyle: TextStyle(
                        color: Colors.white
                        )
                        ),
                ),
                SizedBox(height: 30),
                TextFormField(
                  onChanged: (text) {
                    senha = text;
                  },
                  autofocus: true,
                  obscureText: true,
                  style: new TextStyle(
                    color: Colors.black, 
                    fontSize: 30
                    ),
                  decoration: InputDecoration(
                      labelText: "Senha",
                      labelStyle: TextStyle(color: Colors.white)),
                ),
                SizedBox(height: 30),
                ButtonTheme(
                    minWidth: 180.0,
                    height: 60.0,
                    child: RaisedButton(
                      onPressed: () {
                        if (login == 'Bruno' && senha == '123') {
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => HomeApp()) 
                          );
                        } else {
                          print('login invalido');
                        }
                      },
                      child: Text(
                        "ENTRAR",
                        style: TextStyle(color: Colors.black),
                      ),
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                  ))
              ],
            ),
          )),
    );
  }
}