import 'package:corona_tracking_appp/constants.dart';
import 'package:corona_tracking_appp/models/kuwait_data_model.dart';
import 'package:corona_tracking_appp/models/nepal_data_model.dart';
import 'package:corona_tracking_appp/screens/nepal_data.dart';
import 'package:corona_tracking_appp/services/network_helper.dart';
import 'package:corona_tracking_appp/widgets/button.dart';
import 'package:corona_tracking_appp/widgets/data_card.dart';
import 'package:flutter/material.dart';

import 'kuwait_data.dart';

class HomePage extends StatelessWidget {
  final worldWideData;
  HomePage({this.worldWideData});

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          backgroundColor: Color(0xFFfff48f).withOpacity(0.9),
          title: Text(
            'Corona Tracker',
            style: kAppBarTextStyle,
          ),
          centerTitle: true,
          leading: IconButton(
              icon: Icon(
                Icons.menu,
                color: Colors.black,
              ),
              onPressed: () {
                _scaffoldKey.currentState.openDrawer();
              }),
        ),
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.9),
                  image: DecorationImage(
                    image: AssetImage(
                      'images/drawerImage.PNG',
                    ),
                  ),
                ),
                child: null,
              ),
              ListTile(
                contentPadding: EdgeInsets.all(10.0),
                title: Row(
                  children: <Widget>[
                    Text(
                      '🌍',
                      style: TextStyle(
                        fontSize: 30.0,
                      ),
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Text(
                      'WORLDWIDE DATA',
                      style: TextStyle(
                        fontSize: 16.0,
                        letterSpacing: 1.5,
                        fontFamily: 'Rowdies',
                      ),
                    ),
                  ],
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
        body: CoronaMeter(
          data: worldWideData,
        ),
      ),
    );
  }
}

class CoronaMeter extends StatefulWidget {
  final data;
  CoronaMeter({this.data});

  @override
  _CoronaMeterState createState() => _CoronaMeterState();
}

class _CoronaMeterState extends State<CoronaMeter> {
  List<NepalDataModel> _nepalData = [];
  List<KuwaitDataModel> _kuwaitData = [];
  // List<AllCountriesDataModel> _allCountriesData = [];

  int _infectedData;
  int _deathData;
  int _recoveredData;
  int _seriousCases;
  int _newDeaths;
  int _newCases;

  _updateData(dynamic worldWide) {
    setState(() {
      if (worldWide == null) {
        _infectedData = 0;
        _deathData = 0;
        _recoveredData = 0;
        _seriousCases = 0;
        _newCases = 0;
        _newDeaths = 0;
      }

      _infectedData = worldWide[0].totalInfected;
      _deathData = worldWide[0].totalDeath;
      _recoveredData = worldWide[0].totalRecovered;
      _seriousCases = worldWide[0].seriousCases;
      _newCases = worldWide[0].newCases;
      _newDeaths = worldWide[0].newDeaths;
    });
  }

  getNepalData() async {
    var nepalCoronaData = await NetworkHelper().getNepalData();
    _nepalData.add(nepalCoronaData);
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return NepalData(
        nepalData: _nepalData,
      );
    }));
  }

  getKuwaitData() async {
    var kuwaitCoronaData = await NetworkHelper().getKuwaitData();
    _kuwaitData.add(kuwaitCoronaData);
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return KuwaitData(
        kuwaitData: _kuwaitData,
      );
    }));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _updateData(widget.data);
  }

  RegExp reg = new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
  Function mathFunc = (Match match) => '${match[1]},';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 5.0, horizontal: 18.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'WORLDWIDE',
                    style: kHeadingTextStyle,
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.refresh,
                      size: 30.0,
                    ),
                    onPressed: () {
                      _updateData(widget.data);
                    },
                  ),
                ],
              ),
            ),
            DataCard(
              title: 'Infected:',
              data: _infectedData.toString().replaceAllMapped(reg, mathFunc),
              colour: kInfectedColor,
            ),
            DataCard(
              title: 'Death:',
              data: _deathData.toString().replaceAllMapped(reg, mathFunc),
              colour: kDeathColor,
            ),
            DataCard(
              title: 'Recovered:',
              data: _recoveredData.toString().replaceAllMapped(reg, mathFunc),
              colour: kRecoveredColor,
            ),
            DataCard(
              title: 'Serious Cases:',
              data: _seriousCases.toString().replaceAllMapped(reg, mathFunc),
              colour: kSeriousCases,
            ),
            DataCard(
              title: 'New Cases Today:',
              data: "+${_newCases.toString().replaceAllMapped(reg, mathFunc)}",
              colour: kInfectedColor,
            ),
            DataCard(
              title: 'New Deaths Today:',
              data: "+${_newDeaths.toString().replaceAllMapped(reg, mathFunc)}",
              colour: kDeathColor,
            ),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CountryButton(
                  onPressed: () {
                    getNepalData();
                  },
                  text: 'NEPAL',
                ),
                SizedBox(width: 10.0),
                CountryButton(
                  onPressed: () {
                    getKuwaitData();
                  },
                  text: 'KUWAIT',
                ),
              ],
            ),
            // RaisedButton(
            //   onPressed: () {},
            //   child: Text('ALL COUNTRIES'),
            // ),
          ],
        ),
      ),
    );
  }
}

// ToggleButtons(
//             children: _buttons,
//             isSelected: isSelected,
//             onPressed: (int index) {
//               setState(() {
//                 isSelected[index] = !isSelected[index];
//               });
//             },
//           ),
