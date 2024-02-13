import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ListaClientesVT extends StatefulWidget {
  const ListaClientesVT({Key?key}) : super(key: key);

  @override
  _ListaClientesVT createState() => _ListaClientesVT();
}

class _ListaClientesVT extends State<ListaClientesVT> {
// ignore: non_constant_identifier_names
List<String> ListaClientesVT = [];

@override
void initState() {
  super.initState();
  _carregarClientes();
}
// Carregar os clientes CABUKEM ao iniciar a tela

// Função para carregar os clientes CABUKEM do SharedPreferences
Future<void> _carregarClientes() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  if (prefs.containsKey('ListaClientesVT')) {
    setState(() {
      ListaClientesVT = prefs.getStringList('ListaClientesVT')!;
    });
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text(
          'Lista de Clientes - VT FISCHER',
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: ListaClientesVT.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 5.0,
              margin: const EdgeInsets.symmetric(vertical: 8.0),
              child: ListTile(
                title: Text(ListaClientesVT[index]),
                // Adicione outros widgets ou informações do cliente conforme necessário
              ),
            );
          },
        ),
      ),
    );
  }
}
