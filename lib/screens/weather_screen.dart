import 'package:flutter/material.dart';
import 'package:weatherapp/models/weather.dart';

class WeatherScreen extends StatelessWidget {
  WeatherData weatherData;
  WeatherScreen({Key? key, required this.weatherData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Weather Screen'),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 180,
                width: 300,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  color: Colors.blue[300],
                ),
                child: Center(
                    child: Text(
                  weatherData.name,
                  style: const TextStyle(fontSize: 40, color: Colors.white),
                )),
              ),
            ),
          ],
        ));
  }
}
