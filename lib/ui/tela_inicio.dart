import 'package:flutter/material.dart';

// Tela de Login simples
class TelaLogin extends StatelessWidget {
  const TelaLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Seja Bem-Vindo')),
      body: Center(
        child: ElevatedButton(
          child: const Text('Fazer agendamento'),
          onPressed: () {
          
            Navigator.pushReplacementNamed(context, 'inicio');
          },
        ),
      ),
    );
  }
}


class TelaInicio extends StatelessWidget {
  const TelaInicio({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Barbearia do seu João')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, 'novo_agendamento');
              },
              child: const Text('Novo Agendamento'),
            ),
          ],
        ),
      ),
    );
  }
}
