class TemperatureService {
  // Converte Celsius para Fahrenheit
  static double celsiusToFahrenheit(double celsius) {
    return celsius * 9 / 5 + 32;
  }

  // Converte Fahrenheit para Celsius
  static double fahrenheitToCelsius(double fahrenheit) {
    return (fahrenheit - 32) * 5 / 9;
  }
}
