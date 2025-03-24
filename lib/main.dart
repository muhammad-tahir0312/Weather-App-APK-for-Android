import 'package:flutter/material.dart';
import 'service.dart';
import 'weather_modal.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: WeatherScreen(),
    );
  }
}

class WeatherScreen extends StatefulWidget {
  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  final WeatherService _weatherService = WeatherService();
  late Future<Weather> _weather;

  @override
  void initState() {
    super.initState();
    _weather = _weatherService.fetchWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Weather in Karachi')),
      body: Center(
        child: FutureBuilder<Weather>(
          future: _weather,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text("Error: ${snapshot.error}");
            } else if (!snapshot.hasData) {
              return Text("No data available");
            } else {
              final weather = snapshot.data!;
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    weather.city,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "${weather.main.currentTemp}°C",
                    style: TextStyle(fontSize: 40),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "High: ${weather.main.highTemp}°C  |  Low: ${weather.main.lowTemp}°C",
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(height: 10),
                  Text(
                    weather.weather.first.description.toUpperCase(),
                    style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}