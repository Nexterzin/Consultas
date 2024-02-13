import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ListaClientePJMPage extends StatefulWidget {
  const ListaClientePJMPage({Key? key}) : super(key: key);

  @override
  _ListaClientePJMPageState createState() => _ListaClientePJMPageState();
}

class _ListaClientePJMPageState extends State<ListaClientePJMPage> {
  // ignore: unused_local_variable, non_constant_identifier_names
  List<String> ListaClientePJMPage = [];

  @override
  void initState() {
    super.initState();
    _carregarClientes();
  }
  // Carregar os clientes CABUKEM ao iniciar a tela

  // Função para carregar os clientes CABUKEM do SharedPreferences
  Future<void> _carregarClientes() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey('ListaClientePJMPage')) {
      setState(() {
        ListaClientePJMPage = prefs.getStringList('ListaClientePJMPage')!;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text(
          'Lista de Clientes - PJM',
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: ListaClientePJMPage.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 5.0,
              margin: const EdgeInsets.symmetric(vertical: 8.0),
              child: ListTile(
                title: Text(ListaClientePJMPage[index]),
                // Adicione outros widgets ou informações do cliente conforme necessário
              ),
            );
          },
        ),
      ),
    );
  }
}
