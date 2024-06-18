import '../Model/weather_model.dart';
import '../Service/weather_service.dart';

class WeatherController {
  List<Weather> listWeather = [];
  WeatherService _service = new WeatherService();

  Future<void> getFromWeatherService(String city) async {
    Weather weather = Weather.fromJson(await _service.getWeather(city));
    listWeather.add(weather);
  }

  Future<double> getUvIndex(double lat, double lon) async {
    final uvData = await _service.getUvIndex(lat, lon);
    return uvData['value'];
  }

  Future<int> getAirQuality(double lat, double lon) async {
    final airData = await _service.getAirQuality(lat, lon);
    return airData['list'][0]['main']['aqi'];
  }

  Future<String> getMoonPhase(String date) async {
    final moonData = await _service.getMoonPhase(date);
    return moonData['data']['moonPhase']['phase']['name'];
  }
}