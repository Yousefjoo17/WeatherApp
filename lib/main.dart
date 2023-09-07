import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/Providers/Weather_cubit.dart';
import 'package:weather_app/Providers/theme_notifier.dart';
import 'package:weather_app/pages/home_page.dart';
import 'package:weather_app/services/weather_service.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        BlocProvider(
          create: (context) {
            return WeatherCubit(
              WeatherService(),
            );
          },
        ),
        ChangeNotifierProvider(
          create: (context) {
            return ThemeNotifier();
          },
        ),
      ],
      child: WeatherApp(),
    ),
  );
}

class WeatherApp extends StatelessWidget {
  WeatherApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch:
            Provider.of<ThemeNotifier>(context).primarySwatch ?? Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
