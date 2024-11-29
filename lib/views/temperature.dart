import 'package:flutter/material.dart';

class TemperatureResult extends StatelessWidget {
  final String result;

  const TemperatureResult({Key? key, required this.result}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      result,
      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      textAlign: TextAlign.center,
    );
  }
}
