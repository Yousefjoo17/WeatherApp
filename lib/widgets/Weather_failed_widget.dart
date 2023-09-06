import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WeatherFailureWidget extends StatelessWidget {
  const WeatherFailureWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 400,
        width: 350,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: Colors.red),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.error,
              color: Colors.black,
              size: 90,
            ),
            Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text(
                "Error.. Enter valid city name please .",
                style: TextStyle(fontSize: 40),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
