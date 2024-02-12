import 'package:flutter/material.dart';

class ListaClienteVP extends StatelessWidget {
  final List<String> listaClientes;

  ListaClienteVP({Key? key, required this.listaClientes}) : super(key: key);

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
          itemCount: listaClientes.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 5.0,
              margin: const EdgeInsets.symmetric(vertical: 8.0),
              child: ListTile(
                title: Text(listaClientes[index]),
                // Adicione outros widgets ou informações do cliente conforme necessário
              ),
            );
          },
        ),
      ),
    );
  }
}
