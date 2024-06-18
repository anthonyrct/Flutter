import 'package:flutter/material.dart';
import 'package:projeto_api_localizacao/Model/city_db_model.dart';

import '../Controller/city_db_controller.dart';
import '../Controller/weather_controller.dart';

class CityDetailsScreen extends StatefulWidget {
  final String city;
  const CityDetailsScreen({super.key, required this.city});

  @override
  State<CityDetailsScreen> createState() => _CityDetailsScreenState();
}

class _CityDetailsScreenState extends State<CityDetailsScreen> {
  final WeatherController _controller = WeatherController();
  bool isFavorited = false;
  final CityDbController _dbController = CityDbController();
  late CityDb cityDb;
  double uvIndex = 0.0;
  int airQuality = 0;
  String moonPhase = '';

  @override
  void initState() {
    super.initState();
    _favoriteState(widget.city);
    _getAdditionalData();
  }

  Future<void> _favoriteState(String city) async {
    cityDb = (await _dbController.getCity(city))!;
    if (cityDb.favoritesCities == 0) {
      isFavorited = false;
    } else {
      isFavorited = true;
    }
    setState(() {});
  }

  Future<void> _getAdditionalData() async {
    final weather = await _controller.getFromWeatherService(widget.city);
    final location = weather.location; // Supondo que você tenha latitude e longitude
    uvIndex = await _controller.getUvIndex(location.latitude, location.longitude);
    airQuality = await _controller.getAirQuality(location.latitude, location.longitude);
    moonPhase = await _controller.getMoonPhase(DateTime.now().toIso8601String());
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.city),
      ),
      body: Padding(
        padding: EdgeInsets.all(12),
        child: Center(
          child: FutureBuilder(
            future: _controller.getFromWeatherService(widget.city),
            builder: (context, snapshot) {
              if (_controller.listWeather.isEmpty) {
                return CircularProgressIndicator();
              } else {
                return Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(_controller.listWeather.last.city),
                        IconButton(
                          icon: isFavorited
                              ? Icon(Icons.favorite)
                              : Icon(Icons.favorite_border_outlined),
                          onPressed: () {
                            setState(() {
                              isFavorited = !isFavorited;
                            });
                            if (isFavorited == true) {
                              cityDb.favoritesCities = 1;
                              _dbController.update(cityDb);
                            } else {
                              cityDb.favoritesCities = 0;
                              _dbController.update(cityDb);
                            }
                          },
                        )
                      ],
                    ),
                    const SizedBox(height: 12),
                    Text(_controller.listWeather.last.description),
                    const SizedBox(height: 12),
                    Text((_controller.listWeather.last.temp - 273).toStringAsFixed(2)),
                    const SizedBox(height: 12),
                    _buildAdditionalInfo(),
                  ],
                );
              }
            },
          ),
        ),
      ),
    );
  }

  Widget _buildAdditionalInfo() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(FontAwesomeIcons.sun),
            SizedBox(width: 8),
            Text('UV Index: $uvIndex'),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(FontAwesomeIcons.wind),
            SizedBox(width: 8),
            Text('Air Quality: $airQuality'),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(FontAwesomeIcons.moon),
            SizedBox(width: 8),
            Text('Moon Phase: $moonPhase'),
          ],
        ),
      ],
    );
  }
}