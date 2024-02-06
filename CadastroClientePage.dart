import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'ListaClienteCABUKEM.dart';

class CadastroClientePage extends StatefulWidget {
  const CadastroClientePage({Key? key}) : super(key: key);

  @override
  _CadastroClientePageState createState() => _CadastroClientePageState();
}

class _CadastroClientePageState extends State<CadastroClientePage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _nomeController = TextEditingController();
  String _botaoSelecionado = '';
  
  // Listas para cada representante
  List<String> ListaClientesVT = [];
  List<String> ListaClientesVP = [];
  List<String> ListaClientesCABUKEM = [];
  List<String> ListaClientesPJM = [];

  @override
  void initState() {
    super.initState();
    _carregarListasSalvas();
  }

  Future<void> _carregarListasSalvas() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      ListaClientesCABUKEM = prefs.getStringList('ListaClientesCABUKEM') ?? [];
      ListaClientesVP = prefs.getStringList('ListaClienteVP') ?? [];
      ListaClientesVT = prefs.getStringList('ListaClienteVT') ?? [];
      ListaClientesPJM = prefs.getStringList('ListaClientePJM') ?? [];
    });
  }

  Future<void> _salvarListas() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList('ListaClienteCABUKEM', ListaClientesCABUKEM);
    prefs.setStringList('ListaClienteVP', ListaClientesVP);
    prefs.setStringList('ListaClienteVT', ListaClientesVT);
    prefs.setStringList('ListaClientePJM', ListaClientesPJM);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Cadastro de Cliente',
          style: TextStyle(
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nomeController,
                decoration: const InputDecoration(labelText: 'Nome'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira o nome';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              // Campo de seleção do botão
              DropdownButtonFormField<String>(
                value: _botaoSelecionado.isNotEmpty
                    ? _botaoSelecionado
                    : null, // Corrigindo o valor inicial
                onChanged: (value) {
                  setState(() {
                    _botaoSelecionado = value!;
                  });
                },
                items: [
                  DropdownMenuItem(
                    value: 'VT FISCHER',
                    child: Text('VT FISCHER'),
                  ),
                  DropdownMenuItem(
                    value: 'V.P. REPRESENTAÇÃO',
                    child: Text('V.P. REPRESENTAÇÃO'),
                  ),
                  DropdownMenuItem(
                    value: 'CABUKEM',
                    child: Text('CABUKEM'),
                  ),
                  DropdownMenuItem(
                    value: 'PJM',
                    child: Text('PJM'),
                  )
                ],
                decoration: const InputDecoration(labelText: 'Selecionar Botão'),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    // Obtenha os dados do formulário
                    final nome = _nomeController.text;

                    // Adiciona o cliente a lista correspondente do representante
                    if (_botaoSelecionado == 'VT FISCHER'){
                      ListaClientesVT.add(nome);
                    } else if (_botaoSelecionado == 'V.P. REPRESENTAÇÃO') {
                      ListaClientesVP.add(nome);
                    } else if (_botaoSelecionado == 'CABUKEM') {
                      ListaClientesCABUKEM.add(nome);
                    } else if (_botaoSelecionado == 'PJM') {
                      ListaClientesPJM.add(nome);
                    }
                    Navigator.push(
                      context,
                     MaterialPageRoute(builder: (context)=> ListaClienteCABUKEM(
                      listaClientes: _botaoSelecionado == 'CABUKEM' ? ListaClientesCABUKEM : [],
                      ),
                      ),
                      );
                    };
                  },
                child: const Text('Cadastrar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
