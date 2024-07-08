// main.dart

import 'package:flutter/material.dart';
import 'package:HimnarioID/splash.dart';

// Importa la pantalla de lista de alabanzas

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Alabanzas App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:
          const Splash(), // Punto de entrada con la pantalla de lista de alabanzas
    );
  }
}
