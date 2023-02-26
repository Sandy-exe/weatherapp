import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:weatherapp/constants/constant.dart';
import 'package:weatherapp/screens/weather_screen.dart';

import '../models/weather.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({Key? key}) : super(key: key);
  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  void getLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    var latitude = position.latitude;
    var longitude = position.longitude;
    print(latitude);
    print(longitude);
    getData(latitude, longitude);
  }

  void getData(var latitude, var longitude) async {
    var url = Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey');
    var response = await http.get(url);
    print('Response status: ${response.statusCode}');
    if (response.statusCode == 200) {
      var data = response.body;
      //String cityName = jsonDecode(data)['name'];
      //double temp = jsonDecode(data)['main']['temp'];
      var weatherData = WeatherData.fromJson(jsonDecode(data));
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => WeatherScreen(
                    weatherData: weatherData,
                  )));
    }
  }

  @override
  void initState() {
    getLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hola Amigo!!"),
      ),
      body: const CircularProgressIndicator(),
    );
  }
}
