import 'package:flutter/material.dart';

class TelaAdmin extends StatelessWidget {
  const TelaAdmin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Área Admin')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
               
              },
              child: const Text('Gerenciar Agendamentos'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                
              },
              child: const Text('Gerenciar Usuários'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                
              },
              child: const Text('Gerenciar Serviços'),
            ),
          ],
        ),
      ),
    );
  }
}
