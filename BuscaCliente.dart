import 'package:flutter/material.dart';

class BuscaCliente extends StatelessWidget {
  const BuscaCliente({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.brown,
        appBar: AppBar(
          title: const Text('Pagina Inicial'),
          elevation: 7.0,
          backgroundColor: Colors.cyan,
          centerTitle: true,
        ),
      ),  
    );
  }
}