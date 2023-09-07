import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/Providers/Weather_cubit.dart';
import 'package:weather_app/Providers/theme_notifier.dart';

import '../Models/weather_model.dart';

class WeatherSucessWidget extends StatelessWidget {
  const WeatherSucessWidget({
    required this.weatherdata,
  });

  final WeatherModel? weatherdata;

  @override
  Widget build(BuildContext context) {
    
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            weatherdata!.getthemecolor(),
            weatherdata!.getthemecolor()[300]!,
            weatherdata!.getthemecolor()[100]!,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Spacer(flex: 3),
          Text(
            BlocProvider.of<WeatherCubit>(context).cityname!,
            style: const TextStyle(fontSize: 40),
          ),
          Text(
            'updated at: ${weatherdata!.date.hour.toString()}:${weatherdata!.date.minute.toString()}',
            style: const TextStyle(fontSize: 20),
          ),
          const Spacer(flex: 1),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.network(
                'https:${weatherdata!.icon}',
                height: 100,
                width: 100,
                fit: BoxFit.cover,
              ),
              Text(
                weatherdata!.temp.toInt().toString(),
                style: TextStyle(fontSize: 30),
              ),
              Column(
                children: [
                  Text('Max Temp: ${weatherdata!.maxtemp.toInt()}'),
                  Text('Min Temp: ${weatherdata!.mintemp.toInt()}'),
                ],
              ),
            ],
          ),
          const Spacer(flex: 1),
          Text(
            weatherdata?.weatherstatename ?? '',
            style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          const Spacer(flex: 6),
        ],
      ),
    );
  }
}
