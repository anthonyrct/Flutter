import 'dart:convert';
import 'package:http/http.dart' as http;

class WeatherService {
  final String apiKey = 'b9ebe666087f299f5e2aad3a03d093b6';
  final String baseUrl = 'https://api.openweathermap.org/data/2.5';

  Future<Map<String, dynamic>> getWeather(String city) async {
    final url = Uri.parse('$baseUrl/weather?q=$city&appid=$apiKey');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load weather data');
    }
  }

  Future<Map<String, dynamic>> getUvIndex(double lat, double lon) async {
    final url = Uri.parse('$baseUrl/uvi?lat=$lat&lon=$lon&appid=$apiKey');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load UV index data');
    }
  }

  Future<Map<String, dynamic>> getAirQuality(double lat, double lon) async {
    final url = Uri.parse('$baseUrl/air_pollution?lat=$lat&lon=$lon&appid=$apiKey');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load air quality data');
    }
  }

  Future<Map<String, dynamic>> getMoonPhase(String date) async {
    final url = Uri.parse('https://api.astronomyapi.com/api/v2/studio/moon-phase?date=$date');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load moon phase data');
    }
  }
}