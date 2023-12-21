import 'package:flutter/material.dart';

class CadastroClientePage extends StatefulWidget {
  const CadastroClientePage({Key? key}) : super(key: key);

  @override
  _CadastroClientePageState createState() => _CadastroClientePageState();
}

class _CadastroClientePageState extends State<CadastroClientePage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _nomeController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  String _botaoSelecionado = ''; // Armazena o botão selecionado

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro de Cliente'),
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
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(labelText: 'E-mail'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira o e-mail';
                  } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                      .hasMatch(value)) {
                    return 'Por favor, insira um e-mail válido';
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
                  // Adicione mais opções conforme necessário
                ],
                decoration: const InputDecoration(labelText: 'Selecionar Botão'),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    // Obtenha os dados do formulário
                    final nome = _nomeController.text;
                    final email = _emailController.text;

                    // Use os dados como necessário, incluindo o botão selecionado
                    print('Nome: $nome, E-mail: $email, Botão: $_botaoSelecionado');
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
