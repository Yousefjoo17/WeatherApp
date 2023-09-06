import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/Cubits/Weather_cubit.dart';
import 'package:weather_app/Cubits/Weather_states.dart';
import 'package:weather_app/pages/search_page.dart';
import '../widgets/Weather_Sucess_Widget.dart';
import '../widgets/Weather_failed_widget.dart';
import '../widgets/Weather_initial_widget.dart';

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return SearchPage();
                  },
                ),
              );
            },
            icon: const Icon(Icons.search),
          ),
        ],
        title: const Text('Weather'),
      ),
      body: BlocBuilder<WeatherCubit, WeatherState>(
        builder: (context, state) {
          if (state is WeatherLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is WeatherSuccess) {
            return WeatherSucessWidget(weatherdata: state.weatherModel);
          } else if (state is WeatherFailure) {
            return const WeatherFailureWidget();
          } else {
            return WeatherInitialWidget();
          }
        },
      ),
    );
  }
}
