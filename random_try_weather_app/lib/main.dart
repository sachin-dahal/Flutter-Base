import 'package:flutter/material.dart';
import 'package:weatherapp/screens/loading_screen.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Weather App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        primaryColor: Colors.blueGrey,
        accentColor: Colors.red,
        buttonColor: Colors.redAccent,
      ),
      home: Home(),
    ),
  );
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Weather App"),
          centerTitle: true,
        ),
        body: Container(
          child: Center(
            child: RaisedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return LoadingScreen();
                }));
              },
              child: Text("Get Weather"),
              splashColor: Colors.deepOrangeAccent,
            ),
          ),
        ),
      ),
    );
  }
}
