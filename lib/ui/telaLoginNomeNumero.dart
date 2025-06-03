import 'package:flutter/material.dart';

class TelaLoginNomeNumero extends StatefulWidget {
  const TelaLoginNomeNumero({Key? key}) : super(key: key);

  @override
  State<TelaLoginNomeNumero> createState() => _TelaLoginNomeNumeroState();
}

class _TelaLoginNomeNumeroState extends State<TelaLoginNomeNumero> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _numeroController = TextEditingController();

  bool validarTelefone(String valor) {
    String numeroLimpo = valor.replaceAll(RegExp(r'[\s\-\(\)\+]'), '');
    return RegExp(r'^(55)?[1-9]{2}9[0-9]{8}$').hasMatch(numeroLimpo);
  }

  void _fazerLogin() {
    if (_formKey.currentState!.validate()) {
      Navigator.pushReplacementNamed(context, 'inicio');
    }
  }

  @override
  void dispose() {
    _nomeController.dispose();
    _numeroController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[900],
        title: const Text('Login'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, 'admin');
            },
            child: Text(
              'Área Admin',
              style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: _nomeController,
                decoration: const InputDecoration(
                  labelText: 'Nome',
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira seu nome';
                  }
                  return null;
                },
                textCapitalization: TextCapitalization.words,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _numeroController,
                decoration: const InputDecoration(
                  labelText: 'Número',
                  prefixIcon: Icon(Icons.phone),
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira seu número';
                  }
                  if (!validarTelefone(value)) {
                    return 'Número inválido';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _fazerLogin,
                  child: const Text('Entrar'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
