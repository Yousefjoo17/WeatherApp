import 'package:flutter/material.dart';

class WeatherModel {
  DateTime date;
  double temp;
  double maxtemp;
  double mintemp;
  String weatherstatename;
  String icon;
  WeatherModel({
    required this.date,
    required this.temp,
    required this.maxtemp,
    required this.mintemp,
    required this.weatherstatename,
    required this.icon,
  });

  factory WeatherModel.fromJson(dynamic data) {
    var forcastdata = data["forecast"]["forecastday"][0]['day'];
    return WeatherModel(
        date: DateTime.parse(data["location"]["localtime"]),
        temp: forcastdata['avgtemp_c'],
        maxtemp: forcastdata['maxtemp_c'],
        mintemp: forcastdata['mintemp_c'],
        weatherstatename: forcastdata["condition"]['text'],
        icon: forcastdata["condition"]['icon']);
  }
  @override
  String toString() {
    //when I print an object this is waht called
    return 'temp=$temp mintemp=$mintemp maxtemp=$maxtemp date=$date';
  }

  MaterialColor getthemecolor() {
    if (weatherstatename == 'Clear') {
      return Colors.lightBlue;
    } else if (weatherstatename == 'Sleet' ||
        weatherstatename == 'Snow' ||
        weatherstatename == 'Hail') {
      return Colors.blue;
    } else if (weatherstatename == 'Heavy Cloud') {
      return Colors.blueGrey;
    } else if (weatherstatename == 'Light Rain' ||
        weatherstatename == 'Heavy Rain' ||
        weatherstatename == "Showers") {
      return Colors.amber;
    } else if (weatherstatename == "Sunny") {
      return Colors.orange;
    } else {
      return Colors.blue;
    }
  }
}
