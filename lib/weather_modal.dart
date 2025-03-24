import 'package:json_annotation/json_annotation.dart';
part 'weather_modal.g.dart';

@JsonSerializable()
class Weather {
  @JsonKey(name: 'name')
  String city;

  @JsonKey(name: 'main')
  WeatherMain main;

  @JsonKey(name: 'weather')
  List<WeatherDescription> weather;

  Weather(this.city, this.main, this.weather);

  factory Weather.fromJson(Map<String, dynamic> json) => _$WeatherFromJson(json);
}

@JsonSerializable()
class WeatherMain {
  @JsonKey(name: 'temp')
  double currentTemp;

  @JsonKey(name: 'temp_max')
  double highTemp;

  @JsonKey(name: 'temp_min')
  double lowTemp;

  WeatherMain(this.currentTemp, this.highTemp, this.lowTemp);

  factory WeatherMain.fromJson(Map<String, dynamic> json) => _$WeatherMainFromJson(json);
}

@JsonSerializable()
class WeatherDescription {
  @JsonKey(name: 'description')
  String description;

  WeatherDescription(this.description);

  factory WeatherDescription.fromJson(Map<String, dynamic> json) => _$WeatherDescriptionFromJson(json);
}