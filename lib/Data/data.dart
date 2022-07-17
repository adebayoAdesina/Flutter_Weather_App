import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/Model/weather.dart';

class GetWeathers {
  List<WeatherModel> searchedWeather = [];
  
  Future<void> getWeather(String city) async {
    String url =
        'http://api.openweathermap.org/data/2.5/weather?q=${city}&appid=c78c6aeb3122c76d167e1022b0dfb944';

    var response = await http.get(Uri.parse(url));
    Map<dynamic, dynamic> value = jsonDecode(response.body);
    try {
      // print(value);
      
      WeatherModel weatherModel = WeatherModel(
          cityName: value['name'],
          lat: value['coord']['lat'],
          lon: value['coord']['lon'],
          temp: value['main']['temp'],
          windSpeed: value['wind']['speed'],
          weather: value['weather'][0]['main'],
          description: value['weather'][0]['description'],
          icon: value['weather'][0]['icon']);
      searchedWeather.add(weatherModel);
      // print(weatherModel);
    } catch (e) {
      print(e.toString());
    }
  }
}
