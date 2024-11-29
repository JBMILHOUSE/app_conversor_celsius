import 'package:flutter/material.dart';
import '../services/temperature_service.dart';

class TemperatureConverterView extends StatefulWidget {
  const TemperatureConverterView({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _TemperatureConverterViewState createState() => 
      _TemperatureConverterViewState();
}

class _TemperatureConverterViewState
    extends State<TemperatureConverterView> {
  final TextEditingController _controller = TextEditingController();
  String _result = '';
  String _conversionType = 'Celsius para Fahrenheit'; // Valor inicial válido

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
    switch (_conversionType) {
      case 'Celsius para Fahrenheit':
        convertedValue = TemperatureService.celsiusToFahrenheit(input);
        setState(() {
          _result =
              '${input.toStringAsFixed(1)}°C é igual a ${convertedValue.toStringAsFixed(1)}°F';
        });
        break;
      case 'Fahrenheit para Celsius':
        convertedValue = TemperatureService.fahrenheitToCelsius(input);
        setState(() {
          _result =
              '${input.toStringAsFixed(1)}°F é igual a ${convertedValue.toStringAsFixed(1)}°C';
        });
        break;
      case 'Celsius para Kelvin':
        convertedValue = TemperatureService.celsiusToKelvin(input);
        setState(() {
          _result =
              '${input.toStringAsFixed(1)}°C é igual a ${convertedValue.toStringAsFixed(1)}K';
        });
        break;
      case 'Kelvin para Celsius':
        convertedValue = TemperatureService.kelvinToCelsius(input);
        setState(() {
          _result =
              '${input.toStringAsFixed(1)}K é igual a ${convertedValue.toStringAsFixed(1)}°C';
        });
        break;
      case 'Fahrenheit para Kelvin':
        convertedValue = TemperatureService.fahrenheitToKelvin(input);
        setState(() {
          _result =
              '${input.toStringAsFixed(1)}°F é igual a ${convertedValue.toStringAsFixed(1)}K';
        });
        break;
      case 'Kelvin para Fahrenheit':
        convertedValue = TemperatureService.kelvinToFahrenheit(input);
        setState(() {
          _result =
              '${input.toStringAsFixed(1)}K é igual a ${convertedValue.toStringAsFixed(1)}°F';
        });
        break;
      default:
        setState(() {
          _result = 'Selecione um tipo de conversão.';
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
            DropdownButton<String>(
              value: _conversionType,
              onChanged: (newValue) {
                setState(() {
                  _conversionType = newValue!;
                });
              },
              items: [
                'Celsius para Fahrenheit',
                'Fahrenheit para Celsius',
                'Celsius para Kelvin',
                'Kelvin para Celsius',
                'Fahrenheit para Kelvin',
                'Kelvin para Fahrenheit',
              ].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: _convertTemperature,
              child: const Text('Converter'),
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
