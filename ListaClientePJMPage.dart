import 'package:flutter/material.dart';

class ListaClientesPJMPage extends StatelessWidget {
   ListaClientesPJMPage({Key? key}) : super(key: key);

  // Simulação de dados para a lista de clientes
  final List<String> listaClientes = [
    'Cliente 1',
    'Cliente 2',
    'Cliente 3',
    // Adicione mais clientes conforme necessário
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Clientes - PJM'),
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
