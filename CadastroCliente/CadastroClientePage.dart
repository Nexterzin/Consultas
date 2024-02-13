import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CadastroClientePage extends StatefulWidget {
  const CadastroClientePage({Key? key, required List listaClientes})
      : super(key: key);

  @override
  _CadastroClientePageState createState() => _CadastroClientePageState();
}

class _CadastroClientePageState extends State<CadastroClientePage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _nomeController = TextEditingController();
  String _botaoSelecionado = '';

  // Lista mutável para armazenar os clientes
  List<String> ListaClientesCABUKEM = [];
  List<String> ListaClientesPJMPage = [];
  List<String> ListaClientesVT = [];
  List<String> ListaClientesVP = [];

  // Carregar a lista de clientes do SharedPreferences ao iniciar a tela
  @override
  void initState() {
    super.initState();
    _carregarClientes();
  }

  Future<void> _carregarClientes() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      // Carregar os clientes do SharedPreferences
      ListaClientesCABUKEM = prefs.getStringList('ListaClientesCABUKEM') ?? [];
      ListaClientesPJMPage = prefs.getStringList('ListaClientesPJMPage') ?? [];
      ListaClientesVT = prefs.getStringList('ListaClientesVT') ?? [];
      ListaClientesVP = prefs.getStringList('ListaClientesVP') ?? [];
    });
  }

  Future<void> _salvarLista() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // Adicionar o novo cliente à lista
    setState(() {
      if (_botaoSelecionado == 'CABUKEM') {
        ListaClientesCABUKEM.add(_nomeController.text);
        prefs.setStringList('ListaClientesCABUKEM', ListaClientesCABUKEM);
        print('Cliente adicionado com sucesso a lista do representante CABUKEM: $ListaClientesCABUKEM');
      } else if (_botaoSelecionado == 'PJM') {
        ListaClientesPJMPage.add(_nomeController.text);
        prefs.setStringList('ListaClientePJMPage', ListaClientesPJMPage);
        print('Cliente adicionado com sucesso a lista do representante PJM: $ListaClientesPJMPage');
      } else if (_botaoSelecionado == 'VT FISCHER') {
        ListaClientesVT.add(_nomeController.text);
        prefs.setStringList('ListaClientesVT', ListaClientesVT);
        print('Cliente adicionado com sucesso a lista do representante VT: $ListaClientesVT');
      } else if (_botaoSelecionado == 'V.P. REPRESENTAÇÃO'); {
        ListaClientesVP.add(_nomeController.text);
        prefs.setStringList('ListaClientesVP', ListaClientesVP);
        print('Cliente adicionado com sucesso a lista do representante VP: $ListaClientesVP');
      }
    });
    // Salvar a lista atualizada no SharedPreferences
    _nomeController.clear();
    // Limpar o campo de texto após adicionar o cliente
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text(
          '   Cadastro de Cliente',
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
                    print('Botão selecionado: $_botaoSelecionado');
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
                decoration:
                    const InputDecoration(labelText: 'Selecionar Botão'),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState?.validate() ?? false) {
                    // Validar o formulário
                    await _salvarLista();
                    // Salvar o novo cliente
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
