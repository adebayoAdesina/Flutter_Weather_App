import 'package:flutter/cupertino.dart';

class WeatherModel {
  String? cityName;
  double? lat;
  double? lon;
  double? temp;
  double? windSpeed;
  String? weather;
  String? description;
  String? icon;

  WeatherModel({
    this.cityName,
    this.lat,
    this.lon,
    this.temp,
    this.windSpeed,
    this.weather,
    this.description,
    this.icon
  });
}