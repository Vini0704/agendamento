import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class TelaNovoAgendamento extends StatefulWidget {
  const TelaNovoAgendamento({Key? key}) : super(key: key);

  @override
  _TelaNovoAgendamentoState createState() => _TelaNovoAgendamentoState();
}

class _TelaNovoAgendamentoState extends State<TelaNovoAgendamento> {
  DateTime _selectedDay = DateTime.now();
  TimeOfDay? _selectedTime;

 
  final List<TimeOfDay> horariosDisponiveis = [
    TimeOfDay(hour: 8, minute: 0),
    TimeOfDay(hour: 8, minute: 30),
    TimeOfDay(hour: 9, minute: 0),
    TimeOfDay(hour: 9, minute: 30),
    TimeOfDay(hour: 10, minute: 0),
    TimeOfDay(hour: 10, minute: 30),
    TimeOfDay(hour: 11, minute: 0),
    TimeOfDay(hour: 11, minute: 30),
    TimeOfDay(hour: 14, minute: 0),
    TimeOfDay(hour: 14, minute: 30),
    TimeOfDay(hour: 15, minute: 0),
    TimeOfDay(hour: 15, minute: 30),
    TimeOfDay(hour: 16, minute: 0),
    TimeOfDay(hour: 16, minute: 30),
    TimeOfDay(hour: 17, minute: 0),
    TimeOfDay(hour: 17, minute: 30),
    TimeOfDay(hour: 18, minute: 0),
  ];

  void _confirmAgendamento() {
    if (_selectedTime == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Por favor, selecione um horário')),
      );
      return;
    }

    final dataFormatada =
        "${_selectedDay.day}/${_selectedDay.month}/${_selectedDay.year}";
    final horarioFormatado = _selectedTime!.format(context);

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Agendamento Confirmado'),
        content: Text('Você agendou para $dataFormatada às $horarioFormatado'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Ok'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Novo Agendamento'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TableCalendar(
              locale: 'pt_BR',
              firstDay: DateTime.now(),
              lastDay: DateTime.now().add(const Duration(days: 365)),
              focusedDay: _selectedDay,
              selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
              onDaySelected: (selectedDay, focusedDay) {
                setState(() {
                  _selectedDay = selectedDay;
                  _selectedTime = null; 
                });
              },
              headerStyle: const HeaderStyle(
                formatButtonVisible: false, // esconde o botão "2 weeks"
              )
            ),

            const SizedBox(height: 20),

            Text('Selecione um horário:',
                style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 10),

            Expanded(
              child: ListView.builder(
                itemCount: horariosDisponiveis.length,
                itemBuilder: (context, index) {
                  final horario = horariosDisponiveis[index];
                  final selecionado = _selectedTime == horario;

                  return ListTile(
                    title: Text(horario.format(context)),
                    trailing: selecionado
                        ? const Icon(Icons.check_circle, color: Colors.green)
                        : null,
                    onTap: () {
                      setState(() {
                        _selectedTime = horario;
                      });
                    },
                  );
                },
              ),
            ),

            ElevatedButton(
              onPressed: _confirmAgendamento,
              child: const Text('Confirmar Agendamento'),
            ),
          ],
        ),
      ),
    );
  }
}
