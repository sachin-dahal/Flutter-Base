class WorldWideDataModel {
  final int totalInfected;
  final int totalDeath;
  final int totalRecovered;
  final int seriousCases;
  final int newCases;
  final int newDeaths;

  WorldWideDataModel.fromJson(Map<String, dynamic> parsedJson)
      : totalInfected = parsedJson['results'][0]['total_cases'],
        totalDeath = parsedJson['results'][0]['total_deaths'],
        totalRecovered = parsedJson['results'][0]['total_recovered'],
        seriousCases = parsedJson['results'][0]['total_serious_cases'],
        newCases = parsedJson['results'][0]['total_new_cases_today'],
        newDeaths = parsedJson['results'][0]['total_new_deaths_today'];
}
