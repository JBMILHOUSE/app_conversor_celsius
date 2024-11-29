import 'package:flutter/material.dart';
import '../services/temperature_service.dart';

class TemperatureConverterView extends StatefulWidget {
  const TemperatureConverterView({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _TemperatureConverterScreenState createState() =>
      _TemperatureConverterScreenState();
}

class _TemperatureConverterScreenState
    extends State<TemperatureConverterView> {
  final TextEditingController _controller = TextEditingController();
  String _result = '';
  bool _isCelsiusToFahrenheit = true;

  // Realiza a conversão com base na seleção do usuário
  void _convertTemperature() {
    final input = double.tryParse(_controller.text);
    if (input == null) {
      setState(() {
        _result = 'Por favor, insira um número válido.';
      });
      return;
    }

    double convertedValue;
    if (_isCelsiusToFahrenheit) {
      convertedValue = TemperatureService.celsiusToFahrenheit(input);
      setState(() {
        _result = '${input.toStringAsFixed(1)}°C é igual a ${convertedValue.toStringAsFixed(1)}°F';
      });
    } else {
      convertedValue = TemperatureService.fahrenheitToCelsius(input);
      setState(() {
        _result = '${input.toStringAsFixed(1)}°F é igual a ${convertedValue.toStringAsFixed(1)}°C';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Conversor de Temperatura'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Insira o valor da temperatura:',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Exemplo: 25.0',
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _isCelsiusToFahrenheit = true;
                    });
                    _convertTemperature();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        _isCelsiusToFahrenheit ? Colors.blue : Colors.grey,
                  ),
                  child: const Text('Celsius para Fahrenheit'),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _isCelsiusToFahrenheit = false;
                    });
                    _convertTemperature();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        !_isCelsiusToFahrenheit ? Colors.blue : Colors.grey,
                  ),
                  child: const Text('Fahrenheit para Celsius'),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Text(
              _result,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
