class NepalDataModel {
  final int totalInfected;
  final int totalDeath;
  final int totalRecovered;
  final int seriousCases;
  final int newCases;
  final int newDeaths;

  NepalDataModel.fromJson(Map<String, dynamic> parsedJson)
      : totalInfected = parsedJson['countrydata'][0]['total_cases'],
        totalDeath = parsedJson['countrydata'][0]['total_deaths'],
        totalRecovered = parsedJson['countrydata'][0]['total_recovered'],
        seriousCases = parsedJson['countrydata'][0]['total_serious_cases'],
        newCases = parsedJson['countrydata'][0]['total_new_cases_today'],
        newDeaths = parsedJson['countrydata'][0]['total_new_deaths_today'];
}
