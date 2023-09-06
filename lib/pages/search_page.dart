import 'package:flutter/material.dart';

import 'package:weather_app/widgets/Custom_search_delegate.dart';

// ignore: must_be_immutable
class SearchPage extends StatelessWidget {
  String? cityname;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search a city'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Center(
          child: TextField(
            onTap: () {
              showSearch(context: context, delegate: CustomSearchDelegate());
            },
            onChanged: (data) {
              showSearch(context: context, delegate: CustomSearchDelegate());
            },
            decoration: const InputDecoration(
              label: Text('Search'),
              hintText: 'Enter a city',
              border: OutlineInputBorder(),
              contentPadding:
                  EdgeInsets.symmetric(vertical: 30, horizontal: 15),
              suffixIcon: Icon(Icons.search),
            ),
          ),
        ),
      ),
    );
  }
}






/*

 onSubmitted: (data) async {
              cityname = data;
              WeatherService weatherService = WeatherService();
              WeatherModel? weatherModel =
                  await weatherService.getweather(cityname: cityname!);

              Provider.of<WeatherProvider>(context, listen: false).weatherData =
                  weatherModel;
              Provider.of<WeatherProvider>(context, listen: false).cityname =
                  cityname;
              Navigator.pop(context);
            },


 */


/*
   suffixIcon: GestureDetector(
                  onTap: () async {
                    WeatherService weatherService = WeatherService();
                    WeatherModel? weatherModel =
                        await weatherService.getweather(cityname: cityname!);
                    Provider.of<WeatherProvider>(context, listen: false)
                        .weatherData = weatherModel;
                    Provider.of<WeatherProvider>(context, listen: false)
                        .cityname = cityname;
                    Navigator.pop(context);
                  },
                  child: Icon(Icons.search)),
              
 */