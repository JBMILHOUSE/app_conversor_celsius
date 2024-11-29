class TemperatureService {
  // Converte Celsius para Fahrenheit
  static double celsiusToFahrenheit(double celsius) {
    return celsius * 9 / 5 + 32;
  }

  // Converte Fahrenheit para Celsius
  static double fahrenheitToCelsius(double fahrenheit) {
    return (fahrenheit - 32) * 5 / 9;
  }

  static double celsiusToKelvin(double celsius) {
    return celsius + 273.15;
  }

  // Converte Kelvin para Celsius
  static double kelvinToCelsius(double kelvin) {
    return kelvin - 273.15;
  }

  // Converte Fahrenheit para Kelvin
  static double fahrenheitToKelvin(double fahrenheit) {
    return (fahrenheit - 32) * 5 / 9 + 273.15;
  }

  // Converte Kelvin para Fahrenheit
  static double kelvinToFahrenheit(double kelvin) {
    return (kelvin - 273.15) * 9 / 5 + 32;
  }
}
