import 'package:flutter/material.dart';

class TelaInicio extends StatelessWidget {
  const TelaInicio({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tela de Início'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, 'novo_agendamento');
              },
              child: const Text('Entrar como Cliente'),
            ),
            const SizedBox(height: 20), // Espaçamento entre os botões
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/');
              },
              child: const Text('Entrar como Administrador'),
            ),
          ],
        ),
      ),
    );
  }
}
