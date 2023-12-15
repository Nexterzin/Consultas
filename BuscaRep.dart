// ignore: file_names
import 'dart:ffi';

import 'package:flutter/material.dart';

class BuscarRep extends StatefulWidget {
  const BuscarRep({Key? key}) : super(key: key);

  @override
  _BuscarRepState createState() => _BuscarRepState();
}

class _BuscarRepState extends State<BuscarRep> {
  final TextEditingController _searchController = TextEditingController();

  final List<String> _dataList = [
  ];
  List<String> _filteredDataList = [];

  @override
  void initState() {
    super.initState();
    _filteredDataList = _dataList;
  }

  void _filterData(String query) {
    setState(() {
      if (query.toLowerCase() == 'cabukem') {
        _filteredDataList = ['COMPANHEIRO DO CAMINHÃO', 'MAVANI', 'PRESIDENTE 222'];
      } else {
        _filteredDataList = _dataList
            .where((item) => item.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.brown,
        appBar: AppBar(
          title: const Text('Buscar cliente por Representante'),
          elevation: 7.0,
          backgroundColor: Colors.cyan,
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                controller: _searchController,
                decoration: const InputDecoration(
                  labelText: 'Pesquisar o Representante',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(),
                  labelStyle: TextStyle(color: Colors.black),
                  filled: true,
                  fillColor: Color.fromARGB(136, 255, 255, 255),
                  contentPadding: EdgeInsets.only(bottom: 30.0),
                ),
                style: const TextStyle(
                  color: Colors.black,
                  fontFamily: 'Sylfaen',
                  fontSize: 20.0,
                  ),
                onChanged: (value) {
                  _filterData(value);
                },
              ),
              const SizedBox(height: 16.0),
              Expanded(
                child: ListView.builder(
                  itemCount: _filteredDataList.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(
                        _filteredDataList[index],
                        style: const TextStyle(
                          fontSize: 18.0,
                          fontFamily: 'Sylfaen',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
