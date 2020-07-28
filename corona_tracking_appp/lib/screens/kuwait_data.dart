import 'package:corona_tracking_appp/widgets/button.dart';
import 'package:corona_tracking_appp/widgets/data_card.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class KuwaitData extends StatefulWidget {
  final kuwaitData;
  KuwaitData({this.kuwaitData});

  @override
  _KuwaitDataState createState() => _KuwaitDataState();
}

class _KuwaitDataState extends State<KuwaitData> {
  int _infectedData;
  int _deathData;
  int _recoveredData;
  int _seriousCases;
  int _newCases;
  int _newDeaths;

  updateData(dynamic kuwaitData) {
    setState(() {
      if (kuwaitData == null) {
        _infectedData = 0;
        _deathData = 0;
        _recoveredData = 0;
        _seriousCases = 0;
        _newCases = 0;
        _newDeaths = 0;
      }

      _infectedData = kuwaitData[0].totalInfected;
      _deathData = kuwaitData[0].totalDeath;
      _recoveredData = kuwaitData[0].totalRecovered;
      _seriousCases = kuwaitData[0].seriousCases;
      _newCases = kuwaitData[0].newCases;
      _newDeaths = kuwaitData[0].newDeaths;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    updateData(widget.kuwaitData);
  }

  RegExp reg = new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
  Function mathFunc = (Match match) => '${match[1]},';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          color: Theme.of(context).scaffoldBackgroundColor,
          padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 40.0),
          child: Column(
            children: <Widget>[
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 18.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'KUWAIT CORONA DATA',
                      style: kHeadingTextStyle,
                    ),
                    IconButton(
                      icon: Icon(Icons.refresh),
                      onPressed: () {},
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
                title: 'Today New Cases:',
                data:
                    "+${_newCases.toString().replaceAllMapped(reg, mathFunc)}",
                colour: kInfectedColor,
              ),
              DataCard(
                title: 'Today New Deaths:',
                data:
                    "+${_newDeaths.toString().replaceAllMapped(reg, mathFunc)}",
                colour: kDeathColor,
              ),
              SizedBox(height: 20.0),
              CountryButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                text: 'WORLDWIDE',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// appBar: AppBar(
//   backgroundColor: Color(0xFFfff48f).withOpacity(0.9),
//   title: Text(
//     'Kuwait Corona Data',
//     style: kAppBarTextStyle,
//   ),
// ),
