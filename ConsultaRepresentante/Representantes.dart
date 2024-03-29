import 'package:flutter/material.dart';
import 'package:representantev1/CadastroCliente/CadastroClientePage.dart';
import 'package:representantev1/ListasCliente/ListaClienteCABUKEM.dart';
import 'package:representantev1/ListasCliente/ListaClientePJMPage.dart';
import 'package:representantev1/ListasCliente/ListaClienteVP.dart';
import 'package:representantev1/ListasCliente/ListaClienteVT.dart';

class Representantes extends StatefulWidget {
  const Representantes({Key? key}) : super(key: key);

  @override
  _RepresentantesState createState() => _RepresentantesState();
}

class _RepresentantesState extends State<Representantes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.brown,
        appBar: AppBar(
          title: const Text(
            'Pagina Representantes',
            style: TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          elevation: 7.0,
          backgroundColor: Colors.cyan,
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) =>
                            const CadastroClientePage(listaClientes: [])),
                  );
                },
                style: ElevatedButton.styleFrom(
                  elevation: 10.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                child: const Text(
                  'Adicionar cliente nos representantes',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.0,
                    fontFamily: 'sylfaen',
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              // Vai para a pagina de adicionar clientes.
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => ListaClientesVT()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 10.0,
                      fixedSize: const Size(160.0, 70.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                    child: const Text(
                      'VT FISCHER',
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
                        MaterialPageRoute(
                            builder: (context) => const ListaClientesVP()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 10.0,
                      fixedSize: const Size(180.0, 70.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                    child: const Text(
                      'V.P. REPRESENTAÇÃO',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.0,
                        fontFamily: 'sylfaen',
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => const ListaClienteCABUKEM()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 10.0,
                      fixedSize: const Size(160.0, 70.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                    child: const Text(
                      'CABUKEM',
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
                        MaterialPageRoute(
                            builder: (context) => const ListaClientePJMPage()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 10.0,
                      fixedSize: const Size(180.0, 70.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                    child: const Text(
                      'PJM',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 23.0,
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
      );
  }
}
