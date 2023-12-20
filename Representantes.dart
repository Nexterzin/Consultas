import 'package:flutter/material.dart';
import 'package:representantev1/AddRep.dart';

class Representantes extends StatefulWidget {
  const Representantes({Key? key}) : super(key: key);

  @override
  _RepresentantesState createState() => _RepresentantesState();
}

class _RepresentantesState extends State<Representantes> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.brown,
        appBar: AppBar(),
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
                        MaterialPageRoute(builder: (context) => const AddRep()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 10.0,
                      fixedSize: const Size(160.0, 130.0),
                    ),
                    child: const Text(
                      'Adicionar Representantes',
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
