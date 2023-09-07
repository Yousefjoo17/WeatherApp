import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/Providers/Weather_cubit.dart';
import 'package:weather_app/Providers/theme_notifier.dart';

class CustomSearchDelegate extends SearchDelegate {
  final List<String> searchItems = [
    'Cairo',
    'London',
    'Alexandria',
    'Paris',
    'Dubai',
    'Istanbul',
    'Shanghai',
    'Sydney',
    'Rome',
    'Bangkok',
    'Toronto',
    'Seoul',
    'Mumbai',
    'Barcelona',
    'Moscow',
    'Dhaka',
    'Lagos',
    'Chicago',
    'Tehran',
    'Bangkok',
    'Atlanta',
    'Santiago',
    'Miami',
    'Osaka',
    'Boston',
    'Zurich',
    'Munich',
    'Hamburg',
    'Helsinki',
    'Manchester',
  ];
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () async {
          //should use async to finsih all the functions and tasks included in that line then transfer to the next line
          await BlocProvider.of<WeatherCubit>(context)
              .getweather(cityname: query);
          BlocProvider.of<WeatherCubit>(context).cityname = query;

          if (searchItems.contains(query)) {
            Provider.of<ThemeNotifier>(context, listen: false).primarySwatch =
                BlocProvider.of<WeatherCubit>(context)
                    .weatherModel!
                    .getthemecolor();
          } else {
            Provider.of<ThemeNotifier>(context, listen: false).primarySwatch =
                Colors.red;
          }
          Navigator.pop(context);
          Navigator.pop(context);
        },
        icon: const Icon(Icons.search),
      ),
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: const Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];
    for (var city in searchItems) {
      if (city.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(city);
      }
    }
    return ListView.builder(
        itemCount: matchQuery.length,
        itemBuilder: (context, index) {
          var result = matchQuery[index];
          return ListTile(
            title: Text(result),
          );
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    for (var city in searchItems) {
      if (city.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(city);
      }
    }
    return ListView.builder(
        itemCount: matchQuery.length,
        itemBuilder: (context, index) {
          var result = matchQuery[index];
          return ListTile(
            title: Text(result),
            onTap: () {
              query = result;
            },
          );
        });
  }
}
