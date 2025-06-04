import 'package:flutter/material.dart';

class TelaAdmin extends StatelessWidget {
  const TelaAdmin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tela Admin')),
      body: Center(
        child: SimpleCard(
          title: 'Nome do Cliente',
          subtitle: 'Número: (11) 99999-9999',
          dataHorario: '03/06/2025 às 14:00',
          onCancel: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}

class SimpleCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String dataHorario;
  final VoidCallback onCancel;

  const SimpleCard({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.dataHorario,
    required this.onCancel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              subtitle,
              style: const TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 8),
            Text(
              dataHorario,
              style: const TextStyle(fontSize: 16, color: Colors.blueGrey),
            ),
            const SizedBox(height: 16),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: onCancel,
                child: const Text('Cancelar'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
