import 'package:corona_tracking_appp/models/worldwide_data_model.dart';
import 'package:corona_tracking_appp/screens/home_page.dart';
import 'package:corona_tracking_appp/services/network_helper.dart';
import 'package:flutter/material.dart';

class LoadingPage extends StatefulWidget {
  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  List<WorldWideDataModel> _worldWide = [];
  NetworkHelper networkHelper = new NetworkHelper();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getWorldWideData();
  }

  void getWorldWideData() async {
    try {
      var worldWideData = await networkHelper.getWorldWideData();
      _worldWide.add(worldWideData);
      print(worldWideData);
      print(_worldWide[0].seriousCases);
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return HomePage(
          worldWideData: _worldWide,
        );
      }));
    } catch (e) {
      print("Error: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
