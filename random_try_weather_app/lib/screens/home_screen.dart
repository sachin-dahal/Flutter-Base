import 'package:flutter/material.dart';
import 'package:weatherapp/services/location.dart';
import 'package:weatherapp/services/weather.dart';
import 'package:weatherapp/widgets.dart';

class HomeScreen extends StatefulWidget {
  final locWeather;

  HomeScreen({this.locWeather});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  Location loc = new Location();
  WeatherModel wm = new WeatherModel();

  int temperature;
  String cityName;
  String weatherIcon;
  String weatherText;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    updateUI(widget.locWeather);
  }

  void updateUI(dynamic weatherData){

    setState(() {
      if (weatherData == null) {
        temperature = 0;
        weatherIcon = 'Error!';
        weatherText = 'Unable to get weather data';
        cityName = '';
        return;
      }

      double temp = weatherData['main']['temp'];
      temperature = temp.toInt();
      cityName = weatherData['name'];
      var condition = weatherData['weather'][0]['id'];
      weatherIcon = wm.getWeatherIcon(condition);
      weatherText = wm.getMessage(temperature);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "$temperature°",
                    style: TextStyle(
                      fontSize: 70.0,
                    ),
                  ),
                  SizedBox(
                    width: 40.0,
                  ),
                  Text(
                    "$weatherIcon",
                    style: TextStyle(
                      fontSize: 50.0,
                    ),
                  )
                ],
              ),
            ),
            Container(child: Padding(
              padding: EdgeInsets.all(30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text("$weatherText", style: TextStyle(
                    fontSize: 20.0,
                  ),),
                ],
              ),
            ),),
            SizedBox(height: 20,),
            CardDetail(
              lead: Icon(Icons.location_on),
              text: "Longitude",
              trailing: Text('26.706'),
            ),
            SizedBox(height: 10,),
            CardDetail(
              lead: Icon(Icons.location_on),
              text: "Latitude",
              trailing: Text('87.291'),
            ),
            SizedBox(height: 10,),
            CardDetail(
              lead: Icon(Icons.filter_vintage),
              text: "Temperature",
              trailing: Text('$temperature°'),
            ),
            SizedBox(height: 10,),
            CardDetail(
              lead: Icon(Icons.tag_faces),
              text: "Representation",
              trailing: Text(
                '$weatherIcon', style: TextStyle(
                fontSize: 35.0,
              ),
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.orangeAccent,
                width: double.infinity,
                height: double.infinity,
                child: Center(
                  child: Text('None of your business!', style: TextStyle(color: Colors.black),),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
