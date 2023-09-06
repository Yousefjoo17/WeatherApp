import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/Cubits/Weather_cubit.dart';

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
          BlocProvider.of<WeatherCubit>(context).getweather(cityname: query);
          BlocProvider.of<WeatherCubit>(context).cityname = query;

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
