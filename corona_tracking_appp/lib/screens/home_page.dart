import 'package:corona_tracking_appp/constants.dart';
import 'package:corona_tracking_appp/services/update_method.dart';
import 'package:corona_tracking_appp/widgets/button.dart';
import 'package:corona_tracking_appp/widgets/data_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WrapperPage extends StatefulWidget {
  final worldWideData;
  final Function onInit;
  final Widget child;
  WrapperPage(
      {this.worldWideData, @required this.onInit, @required this.child});

  @override
  _WrapperPageState createState() => _WrapperPageState();
}

class _WrapperPageState extends State<WrapperPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.onInit != null) {
      widget.onInit();
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}

class CoronaMeter extends StatelessWidget {
  final data;
  CoronaMeter({this.data});

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  final RegExp reg = new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
  final Function mathFunc = (Match match) => '${match[1]},';

  @override
  Widget build(BuildContext context) {
    return WrapperPage(
      onInit: Provider.of<UpdateMethod>(context).updateData(data),
      child: SafeArea(
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
          body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Container(
              color: Theme.of(context).scaffoldBackgroundColor,
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 5.0, horizontal: 18.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'WORLDWIDE',
                          style: kHeadingTextStyle,
                        ),
                        IconButton(
                          splashColor: kRecoveredColor,
                          icon: Icon(
                            Icons.refresh,
                            size: 30.0,
                          ),
                          onPressed: () {
                            Provider.of<UpdateMethod>(context).updateData(data);
                            //_updateData(widget.data);
                          },
                        ),
                      ],
                    ),
                  ),
                  DataCard(
                    title: 'Infected:',
                    data: Provider.of<UpdateMethod>(context)
                        .infectedData
                        .toString()
                        .replaceAllMapped(reg, mathFunc),
                    colour: kInfectedColor,
                  ),
                  DataCard(
                    title: 'Death:',
                    data: Provider.of<UpdateMethod>(context)
                        .deathData
                        .toString()
                        .replaceAllMapped(reg, mathFunc),
                    colour: kDeathColor,
                  ),
                  DataCard(
                    title: 'Recovered:',
                    data: Provider.of<UpdateMethod>(context)
                        .recoveredData
                        .toString()
                        .replaceAllMapped(reg, mathFunc),
                    colour: kRecoveredColor,
                  ),
                  DataCard(
                    title: 'Serious Cases:',
                    data: Provider.of<UpdateMethod>(context)
                        .seriousCases
                        .toString()
                        .replaceAllMapped(reg, mathFunc),
                    colour: kSeriousCases,
                  ),
                  DataCard(
                    title: 'New Cases Today:',
                    data:
                        "+${Provider.of<UpdateMethod>(context).newCases.toString().replaceAllMapped(reg, mathFunc)}",
                    colour: kInfectedColor,
                  ),
                  DataCard(
                    title: 'New Deaths Today:',
                    data:
                        "+${Provider.of<UpdateMethod>(context).newDeaths.toString().replaceAllMapped(reg, mathFunc)}",
                    colour: kDeathColor,
                  ),
                  SizedBox(height: 20.0),
                  SizedBox(height: 10.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CountryButton(
                        onPressed: () {
                          Provider.of<UpdateMethod>(context, listen: false)
                              .getNepalData(context);
                          //getNepalData();
                        },
                        text: 'NEPAL',
                      ),
                      SizedBox(width: 10.0),
                      CountryButton(
                        onPressed: () {
                          Provider.of<UpdateMethod>(context, listen: false)
                              .getKuwaitData(context);
                          //getKuwaitData();
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
          ),
        ),
      ),
    );
  }
}

// SafeArea(
//       child: Scaffold(
//         key: _scaffoldKey,
//         appBar: AppBar(
//           backgroundColor: Color(0xFFfff48f).withOpacity(0.9),
//           title: Text(
//             'Corona Tracker',
//             style: kAppBarTextStyle,
//           ),
//           centerTitle: true,
//           leading: IconButton(
//               icon: Icon(
//                 Icons.menu,
//                 color: Colors.black,
//               ),
//               onPressed: () {
//                 _scaffoldKey.currentState.openDrawer();
//               }),
//         ),
//         drawer: Drawer(
//           child: ListView(
//             children: <Widget>[
//               DrawerHeader(
//                 decoration: BoxDecoration(
//                   color: Colors.grey.withOpacity(0.9),
//                   image: DecorationImage(
//                     image: AssetImage(
//                       'images/drawerImage.PNG',
//                     ),
//                   ),
//                 ),
//                 child: null,
//               ),
//               ListTile(
//                 contentPadding: EdgeInsets.all(10.0),
//                 title: Row(
//                   children: <Widget>[
//                     Text(
//                       '🌍',
//                       style: TextStyle(
//                         fontSize: 30.0,
//                       ),
//                     ),
//                     SizedBox(
//                       width: 10.0,
//                     ),
//                     Text(
//                       'WORLDWIDE DATA',
//                       style: TextStyle(
//                         fontSize: 16.0,
//                         letterSpacing: 1.5,
//                         fontFamily: 'Rowdies',
//                       ),
//                     ),
//                   ],
//                 ),
//                 onTap: () {
//                   Navigator.pop(context);
//                 },
//               ),
//             ],
//           ),
//         ),
//         body: CoronaMeter(
//           data: widget.worldWideData,
//         ),
//       ),
//     );

// ToggleButtons(
//             children: _buttons,
//             isSelected: isSelected,
//             onPressed: (int index) {
//               setState(() {
//                 isSelected[index] = !isSelected[index];
//               });
//             },
//           ),

// List<NepalDataModel> _nepalData = [];
// List<KuwaitDataModel> _kuwaitData = [];
// // List<AllCountriesDataModel> _allCountriesData = [];

// int _infectedData;
// int _deathData;
// int _recoveredData;
// int _seriousCases;
// int _newDeaths;
// int _newCases;

// _updateData(dynamic worldWide) {
//   setState(() {
//     if (worldWide == null) {
//       _infectedData = 0;
//       _deathData = 0;
//       _recoveredData = 0;
//       _seriousCases = 0;
//       _newCases = 0;
//       _newDeaths = 0;
//     }

//     _infectedData = worldWide[0].totalInfected;
//     _deathData = worldWide[0].totalDeath;
//     _recoveredData = worldWide[0].totalRecovered;
//     _seriousCases = worldWide[0].seriousCases;
//     _newCases = worldWide[0].newCases;
//     _newDeaths = worldWide[0].newDeaths;
//   });
// }

// getNepalData() async {
//   var nepalCoronaData = await NetworkHelper().getNepalData();
//   _nepalData.add(nepalCoronaData);
//   Navigator.push(context, MaterialPageRoute(builder: (context) {
//     return NepalData(
//       nepalData: _nepalData,
//     );
//   }));
// }

// getKuwaitData() async {
//   var kuwaitCoronaData = await NetworkHelper().getKuwaitData();
//   _kuwaitData.add(kuwaitCoronaData);
//   Navigator.push(context, MaterialPageRoute(builder: (context) {
//     return KuwaitData(
//       kuwaitData: _kuwaitData,
//     );
//   }));
// }
