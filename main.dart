import 'package:flutter/material.dart';
import 'login.page.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Representantes',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: LoginRep(),
    );
  }
}
