import 'package:corona_tracking_appp/models/kuwait_data_model.dart';
import 'package:corona_tracking_appp/models/nepal_data_model.dart';
import 'package:corona_tracking_appp/screens/kuwait_data.dart';
import 'package:corona_tracking_appp/screens/nepal_data.dart';
import 'package:flutter/material.dart';
import 'network_helper.dart';

class UpdateMethod extends ChangeNotifier {
  List<NepalDataModel> nepalData = [];
  List<KuwaitDataModel> kuwaitData = [];
  // List<AllCountriesDataModel> _allCountriesData = [];

  UpdateMethod({
    this.infectedData,
    this.deathData,
    this.recoveredData,
    this.seriousCases,
    this.newDeaths,
    this.newCases,
  });

  int infectedData;
  int deathData;
  int recoveredData;
  int seriousCases;
  int newDeaths;
  int newCases;

  getNepalData(context) async {
    var nepalCoronaData = await NetworkHelper().getNepalData();
    nepalData.add(nepalCoronaData);
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return NepalData(
        nepalData: nepalData,
      );
    }));
  }

  getKuwaitData(context) async {
    var kuwaitCoronaData = await NetworkHelper().getKuwaitData();
    kuwaitData.add(kuwaitCoronaData);
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return KuwaitData(
        kuwaitData: kuwaitData,
      );
    }));
  }

  updateData(dynamic worldWide) {
    if (worldWide == null) {
      infectedData = 0;
      deathData = 0;
      recoveredData = 0;
      seriousCases = 0;
      newCases = 0;
      newDeaths = 0;
    }
    infectedData = worldWide[0].totalInfected;
    deathData = worldWide[0].totalDeath;
    recoveredData = worldWide[0].totalRecovered;
    seriousCases = worldWide[0].seriousCases;
    newCases = worldWide[0].newCases;
    newDeaths = worldWide[0].newDeaths;
    notifyListeners();
  }

  updateNepalData(dynamic nepalData) {
    if (nepalData == null) {
      infectedData = 0;
      deathData = 0;
      recoveredData = 0;
      seriousCases = 0;
      newCases = 0;
      newDeaths = 0;
    }

    infectedData = nepalData[0].totalInfected;
    deathData = nepalData[0].totalDeath;
    recoveredData = nepalData[0].totalRecovered;
    seriousCases = nepalData[0].seriousCases;
    newCases = nepalData[0].newCases;
    newDeaths = nepalData[0].newDeaths;
    notifyListeners();
  }

  Future<UpdateMethod> nepalDataUpdate(dynamic nepalData) async {
    return await updateNepalData(nepalData);
  }
}
