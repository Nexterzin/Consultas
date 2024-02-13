import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ListaClientesVP extends StatefulWidget {
  const ListaClientesVP({Key?key}) : super(key: key);

  @override
  _ListaClientesVPState createState() => _ListaClientesVPState();
  }

  class _ListaClientesVPState extends State<ListaClientesVP> {
    // ignore: non_constant_identifier_names
    List<String> ListaClientesVP = [];
  

  @override
  void initState() {
    super.initState();
    _carregarClientes();
  }

  Future<void> _carregarClientes() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey('ListaClientesVP')) {
      setState(() {
        ListaClientesVP = prefs.getStringList('ListaClientesVP')!;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text(
          'Lista de Clientes - V.P. REP',
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: ListaClientesVP.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 5.0,
              margin: const EdgeInsets.symmetric(vertical: 8.0),
              child: ListTile(
                title: Text(ListaClientesVP[index]),
                // Adicione outros widgets ou informações do cliente conforme necessário
              ),
            );
          },
        ),
      ),
    );
  }
}