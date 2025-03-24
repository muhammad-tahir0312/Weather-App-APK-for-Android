// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_modal.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Weather _$WeatherFromJson(Map<String, dynamic> json) => Weather(
      json['name'] as String,
      WeatherMain.fromJson(json['main'] as Map<String, dynamic>),
      (json['weather'] as List<dynamic>)
          .map((e) => WeatherDescription.fromJson(e as Map<String, dynamic>)) 
          .toList(),
    );

Map<String, dynamic> _$WeatherToJson(Weather instance) => <String, dynamic>{
      'name': instance.city,
      'main': instance.main,
      'weather': instance.weather,
    };

WeatherMain _$WeatherMainFromJson(Map<String, dynamic> json) => WeatherMain(
      (json['temp'] as num).toDouble(),
      (json['temp_max'] as num).toDouble(),
      (json['temp_min'] as num).toDouble(),
    );

Map<String, dynamic> _$WeatherMainToJson(WeatherMain instance) =>
    <String, dynamic>{
      'temp': instance.currentTemp,
      'temp_max': instance.highTemp,
      'temp_min': instance.lowTemp,
    };

WeatherDescription _$WeatherDescriptionFromJson(Map<String, dynamic> json) =>
    WeatherDescription(
      json['description'] as String,
    );

Map<String, dynamic> _$WeatherDescriptionToJson(WeatherDescription instance) =>
    <String, dynamic>{
      'description': instance.description,
    };
