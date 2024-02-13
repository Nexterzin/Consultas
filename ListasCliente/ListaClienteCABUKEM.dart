import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ListaClienteCABUKEM extends StatefulWidget {
  const ListaClienteCABUKEM({Key? key}) : super(key: key);

  @override
  _ListaClienteCABUKEMState createState() => _ListaClienteCABUKEMState();
}

class _ListaClienteCABUKEMState extends State<ListaClienteCABUKEM> {
  // ignore: non_constant_identifier_names
  List<String> ListaClientesCABUKEM = [];

  @override
  void initState() {
    super.initState();
    _carregarClientes();
  }
// Carregar os clientes CABUKEM ao iniciar a tela

  // Função para carregar os clientes CABUKEM do SharedPreferences
  Future<void> _carregarClientes() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey('ListaClientesCABUKEM')) {
      setState(() {
        ListaClientesCABUKEM = prefs.getStringList('ListaClientesCABUKEM')!;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text(
          'Lista de Clientes - CABUKEM',
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: ListaClientesCABUKEM.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 5.0,
              margin: const EdgeInsets.symmetric(vertical: 8.0),
              child: ListTile(
                title: Text(ListaClientesCABUKEM[index]),
              ),
            );
          },
        ),
      ),
    );
  }
}
