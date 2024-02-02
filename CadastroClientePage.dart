import 'package:flutter/material.dart';

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
  List<String> listaClientesVT = [];
  List<String> listaClientesVP = [];
  List<String> listaClientesCABUKEM = [];
  List<String> listaClientesPJM = [];

  @override
  void initState() {
    super.initState();
    
    // Inicializa as listas
    listaClientesVT = [];
    listaClientesVP = [];
    listaClientesCABUKEM = [];
    listaClientesPJM = [];
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
                      listaClientesVT.add(nome);
                    } else if (_botaoSelecionado == 'V.P. REPRESENTAÇÃO') {
                      listaClientesVP.add(nome);
                    } else if (_botaoSelecionado == 'CABUKEM') {
                      listaClientesCABUKEM.add(nome);
                    } else if (_botaoSelecionado == 'PJM') {
                      listaClientesPJM.add(nome);
                    }
                    // Limpar os campos após o cadastro
                    _nomeController.clear();
                    setState(() {
                      _botaoSelecionado = '';
                    });
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
