import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weatherapp/screens/home_screen.dart';
import 'package:weatherapp/services/weather.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocationData();
  }

  Future <dynamic> getLocationData() async {

    WeatherModel wm = new WeatherModel();
    var weatherData = await wm.getWeatherInfo();
    print(weatherData);

    double temp = weatherData['main']['temp'];
    int temperature = temp.toInt();
    String cityName = weatherData['name'];
    var condition = weatherData['weather'][0]['id'];

    print(temperature);
    print(cityName);
    print(condition);

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return HomeScreen(locWeather: weatherData,);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SpinKitRotatingCircle(
        color: Colors.white,
        size: 100.0,
      ),
    );
  }
}
