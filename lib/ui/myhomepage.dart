import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:myweather/api/LocationApi.dart';
import 'package:myweather/ui/weather.dart';
import 'package:myweather/api/mapapi.dart';
import 'package:myweather/model/weatherdata.dart';
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  WeatherData _weatherData;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      appBar: new AppBar(
        title: Center(child: new Text(widget.title))
      ),
      body: _weatherData !=null ? Weather(weatherData: _weatherData,):
      Center(
        child: CircularProgressIndicator(
          strokeWidth: 4,
          valueColor: AlwaysStoppedAnimation(Colors.white),
        ),
      )
    );
  }

  getCurrentLocation(){
    // LocationApi locationApi = LocationApi.getInstance();
    // final location = await locationApi.getLocation();
    loadWeather(lat:35.6892 ,lon: 51.3890);
  }

  loadWeather({double lat , double lon})async{
    MapApi mapApi = MapApi.getInstance();
    final data = await mapApi.getWeather(lat: lat , lon: lon);
    setState(() {
      this._weatherData = data;
    });
  }
}
