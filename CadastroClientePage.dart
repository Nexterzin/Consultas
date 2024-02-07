import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CadastroClientePage extends StatefulWidget {
  final List<String> listaClientes;

  const CadastroClientePage({Key? key, required this.listaClientes}) : super(key: key);

  @override
  _CadastroClientePageState createState() => _CadastroClientePageState();
}

class _CadastroClientePageState extends State<CadastroClientePage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _nomeController = TextEditingController();
  String _botaoSelecionado = '';

  // Lista mutável para armazenar os clientes
  List<String> ListaClientesCABUKEM = [];
  List<String> ListaClientesVP = [];
  List<String> ListaClientesVT = [];
  List<String> ListaClientesPJM = [];

  @override
  void initState() {
    super.initState();
    // Inicialize a lista mutável com a lista passada
    ListaClientesCABUKEM.addAll(widget.listaClientes);
    ListaClientesVT.addAll(widget.listaClientes);
    ListaClientesVP.addAll(widget.listaClientes);
    ListaClientesPJM.addAll(widget.listaClientes);
  }

  Future<void> _salvarLista() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList('ListaClientesCABUKEM', ListaClientesCABUKEM);
  }

  @override
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
              DropdownButtonFormField<String>(
                value: _botaoSelecionado.isNotEmpty ? _botaoSelecionado : null,
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
                onPressed: () async {
                  if (_formKey.currentState?.validate() ?? false) {
                    final nome = _nomeController.text;
                    if (_botaoSelecionado == 'VT FISCHER'){
                      ListaClientesVT.add(nome);
                    } else if (_botaoSelecionado == 'V.P. REPRESENTAÇÃO') {
                      ListaClientesVP.add(nome);
                    } else if (_botaoSelecionado == 'CABUKEM') {
                      ListaClientesCABUKEM.add(nome);
                    } else if (_botaoSelecionado == 'PJM') {
                      ListaClientesPJM.add(nome);
                    }
                   
                    await _salvarLista();
                  }
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
