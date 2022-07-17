import 'package:flutter/material.dart';
import 'package:weather_app/Widget/searchedWidget.dart';

import '../Data/data.dart';
import '../Model/weather.dart';
import '../Util/colors.dart';

class Searched extends StatefulWidget {
  final String city;
  const Searched({Key? key, required this.city}) : super(key: key);

  @override
  State<Searched> createState() => _SearchedState();
}

class _SearchedState extends State<Searched> {
  List<WeatherModel> searchedWeather = [];
  bool isLoad = false;

  getWeather() async {
    GetWeathers getWeathers = GetWeathers();
    await getWeathers.getWeather(widget.city);
    searchedWeather = getWeathers.searchedWeather;
    setState(() {
      isLoad = true;
    });
  }

  @override
  void initState() {
    getWeather();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: mainColor,
        title: const Text(
          'Weather App',
        ),
        centerTitle: true,
      ),
      body: Container(
        
        child: Center(
          child: isLoad == false
              ? Column(
                  children: [
                    Flexible(
                      child: Container(),
                      flex: 1,
                    ),
                    Image.asset('assets/loading.gif'),
                    const Text('Please wait'),
                    const Text('Make sure you are connected'),
                    Flexible(
                      child: Container(),
                      flex: 1,
                    ),
                  ],
                )
              : ListView.builder(
                  itemCount: searchedWeather.length,
                  itemBuilder: (context, index) => SearchedWidget(
                        city: searchedWeather[index].cityName.toString(),
                        lat: searchedWeather[index].lat!.toDouble(),
                        lon: searchedWeather[index].lon!.toDouble(),
                        temp: searchedWeather[index].temp!.toDouble(),
                        windSpeed: searchedWeather[index].windSpeed!.toDouble(),
                        weather: searchedWeather[index].weather.toString(),
                        description:
                            searchedWeather[index].description.toString(),
                        icon: searchedWeather[index].icon.toString(),
                      )),
        ),
      ),
    );
  }
}
