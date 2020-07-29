import 'dart:convert';
import 'package:corona_tracking_appp/models/kuwait_data_model.dart';
import 'package:http/http.dart' show get;
import 'package:corona_tracking_appp/models/allcountries_data_model.dart';
import 'package:corona_tracking_appp/models/nepal_data_model.dart';
import 'package:corona_tracking_appp/models/worldwide_data_model.dart';

const url = 'https://api.thevirustracker.com/free-api';

class NetworkHelper {
  Future<dynamic> getWorldWideData() async {
    final response = await get('$url?global=stats');
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return WorldWideDataModel.fromJson(data);
    } else {
      print(response.statusCode);
    }
  }

  getNepalData() async {
    final response = await get('$url?countryTotal=NP');
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return NepalDataModel.fromJson(data);
    } else {
      print(response.statusCode);
    }
  }

  getKuwaitData() async {
    final response = await get('$url?countryTotal=KW');
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return KuwaitDataModel.fromJson(data);
    } else {
      print(response.statusCode);
    }
  }

  getAllCountriesData() async {
    final response = await get('$url?countryTotals=ALL');
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return AllCountriesDataModel.fromJson(data);
    } else {
      print(response.statusCode);
    }
  }
}
