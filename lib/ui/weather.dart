import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:myweather/model/weatherdata.dart';

class Weather extends StatelessWidget {

  final WeatherData weatherData;
  Weather({@required this.weatherData});

  @override
  Widget build(BuildContext context) {
    Widget dateSection = Container(
      child: new Text(
        DateFormat('MMMM d, H:m').format(DateTime.now()),
        style: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 25, color: Colors.white),
      ),
    );

    Widget tempSection = Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: new Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          new Text(
            weatherData.temp.toStringAsFixed(0),
            style: TextStyle(fontSize: 80),
          ),
          Expanded(
              child: Container(
            padding: EdgeInsets.only(top: 12),
            margin: EdgeInsets.only(left: 6),
            child: new Text(
              '\u2103',
              style: TextStyle(fontSize: 24),
            ),
          )),
          Image.network(
            'https://openweathermap.org/img/w/${weatherData.icon}.png',
            width: 100.0,
            height: 100.0,
            fit: BoxFit.cover,
          )
        ],
      ),
    );

    Widget descriptionSection = Container(
      child: Padding(
        padding: const EdgeInsets.only(right: 15,left: 15),
        child: new Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            new Text(
              weatherData.name,style: TextStyle(fontSize: 25,color: Colors.white),
            ),
            Text(weatherData.main,style: TextStyle(fontSize: 25,color: Colors.white),)
          ],

        ),
      ),

    );
  


    return Container(
      padding: const EdgeInsets.all(60),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [dateSection, tempSection , descriptionSection],
      ),
    );
  }
}
