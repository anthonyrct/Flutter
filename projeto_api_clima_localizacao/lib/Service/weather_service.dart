import 'package:http/http.dart' as http;
import 'dart:convert';
class WeatherService {

  //atributos
  final String apiKey = 'b9ebe666087f299f5e2aad3a03d093b6';
  final String baseURL = 'https://api.openweathermap.org/data/2.5/weather';

  //metodos
  Future<Map<String, dynamic>> getWeather(String city) async {
    final url = Uri.parse('$baseURL?q=$city&appid=$apiKey');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load weather data');
    }
  }

Future<Map<String, dynamic>> getWeatherByLocation(double lat, double lon) async {
    final url = Uri.parse('$baseURL?lat=$lat&lon=$lon&appid=$apiKey');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load weather data');
    }
  }

}
