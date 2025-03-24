import 'dart:convert';
import 'package:http/http.dart' as http;
import 'weather_modal.dart';

class WeatherService {
  final String apiUrl = "https://api.openweathermap.org/data/2.5/weather?lat=24.8607&lon=67.0011&appid=93f8d960473668e0d0b5fe18b3542457";

  Future<Weather> fetchWeather() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return Weather.fromJson(data);
    } else {
      throw Exception("Failed to load weather data");
    }
  }
}