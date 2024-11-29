import 'package:app_conversor_celsius/views/temperature_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData(colorSchemeSeed: Colors.purpleAccent, useMaterial3: true, brightness: Brightness.dark),
      title: 'Conversor de temperatura',
      home: const TemperatureConverterView(),
    );
  }
}
