import 'package:flutter/material.dart';
import 'package:weather_app/Util/utils.dart';

class SearchedWidget extends StatelessWidget {
  final String city;
  final double lat;
  final double lon;
  final double temp;
  final double windSpeed;
  final String weather;
  final String description;
  final String icon;
  const SearchedWidget(
      {Key? key,
      required this.city,
      required this.lat,
      required this.lon,
      required this.temp,
      required this.windSpeed,
      required this.weather,
      required this.description,
      required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Column(
      children: [
        Center(
          child: Text(
            city,
            style: TextStyle(
              fontSize: SizeConfig.blockSizeHorizontal! * 7,
            ),
          ),
        ),
        sizedbox,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Longitide',
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: SizeConfig.blockSizeHorizontal! * 4),
                ),
                Text(
                  lon.toString(),
                )
              ],
            ),
            sizedboxWidth,
            Column(
              children: [
                Text(
                  'Latitude',
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: SizeConfig.blockSizeHorizontal! * 4),
                ),
                Text(lat.toString())
              ],
            )
          ],
        ),
        sizedbox,
        sizedbox,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text('Temperature'),
                Text(
                  temp.toString(),
                ),
              ],
            ),
            sizedboxWidth,
            Column(
              children: [
                const Text('Wind Speed'),
                Text(
                  windSpeed.toString(),
                ),
              ],
            )
          ],
        ),
        sizedbox,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              weather,
              style: TextStyle(fontSize: SizeConfig.blockSizeHorizontal! * 10),
            ),
            Image.network(
                'http://openweathermap.org/img/wn/${icon.toString()}@2x.png')
          ],
        ),
        Text(description)
      ],
    );
  }

  Widget get sizedbox => const SizedBox(
        height: 10,
      );
  Widget get sizedboxWidth => const SizedBox(
        width: 10,
      );
}
