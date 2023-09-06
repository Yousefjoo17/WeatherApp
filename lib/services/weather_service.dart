import 'dart:convert';

// ignore: unused_import
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/Models/weather_model.dart';

class WeatherService {
  String baseUrl = 'http://api.weatherapi.com/v1';
  String apikey = '26d53213f14248878ae211904232508';
  WeatherModel? weatherModel;
  Future<WeatherModel?> getweather({required String cityname}) async {
    Uri url =
        Uri.parse('$baseUrl/forecast.json?key=$apikey&q=$cityname&days=7');

    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);

      weatherModel = WeatherModel.fromJson(data);
      return weatherModel;
    } else {
      throw Exception('thers an error with stauts code${response.statusCode}');
    }
  }
}
