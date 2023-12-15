import 'package:flutter/material.dart';
import 'BuscaCliente.dart';
import 'BuscaRep.dart';

class HomeApp extends StatelessWidget {
  const HomeApp({Key? key}) : super(key: key);

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
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => BuscarRep())
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 10.0,
                      fixedSize: const Size(155.0, 150.0),
                    ),
                    child: const Text(
                      'Buscar por Representante',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18.0,
                        fontFamily: 'sylfaen',
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => const BuscaCliente())
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 10.0,
                      fixedSize: const Size(155.0, 150.0),
                    ),
                    child: const Text(
                      'Buscar por Cliente',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18.0,
                        fontFamily: 'sylfaen',
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}