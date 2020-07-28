import 'dart:convert';
import 'package:corona_tracking_appp/models/kuwait_data_model.dart';
import 'package:http/http.dart' show get;
import 'package:corona_tracking_appp/models/allcountries_data_model.dart';
import 'package:corona_tracking_appp/models/nepal_data_model.dart';
import 'package:corona_tracking_appp/models/worldwide_data_model.dart';

class NetworkHelper {
  Future<dynamic> getWorldWideData() async {
    final response =
        await get('https://api.thevirustracker.com/free-api?global=stats');
    final data = jsonDecode(response.body);
    print(data);

    return WorldWideDataModel.fromJson(data);
  }

  getNepalData() async {
    final response =
        await get('https://api.thevirustracker.com/free-api?countryTotal=NP');
    final data = jsonDecode(response.body);

    return NepalDataModel.fromJson(data);
  }

  getKuwaitData() async {
    final response =
        await get('https://api.thevirustracker.com/free-api?countryTotal=KW');
    final data = jsonDecode(response.body);

    return KuwaitDataModel.fromJson(data);
  }

  getAllCountriesData() async {
    final response =
        await get('https://api.thevirustracker.com/free-api?countryTotals=ALL');
    final data = jsonDecode(response.body);

    return AllCountriesDataModel.fromJson(data);
  }
}
