import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:tela_agendamento/ui/tela_inicio.dart';
import 'package:tela_agendamento/ui/tela_novo_agendamento.dart';
import 'package:tela_agendamento/ui/telaLoginNomeNumero.dart';
import 'package:tela_agendamento/ui/tela_adm.dart'; 

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'App de Agendamento',
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale('pt', 'BR')],
      initialRoute: '/',
      routes: {
        '/': (context) => const TelaLoginNomeNumero(),
        'inicio': (context) => const TelaInicio(),
        'novo_agendamento': (context) => const TelaNovoAgendamento(),
        'admin': (context) => const TelaAdmin(), 
      },
    );
  }
}
