class AllCountriesDataModel {
  final int countryId;
  final String countryName;
  final int totalInfected;
  final int totalDeath;
  final int totalRecovered;
  final int seriousCases;

  AllCountriesDataModel.fromJson(Map<String, dynamic> parsedJson)
      : countryId = parsedJson['countryitems'][0][1]['ourid'],
        countryName = parsedJson['countryitems'][0][1]['title'],
        totalInfected = parsedJson['countryitems'][0][1]['total_cases'],
        totalDeath = parsedJson['countryitems'][0][1]['total_deaths'],
        totalRecovered = parsedJson['countryitems'][0][1]['total_recovered'],
        seriousCases = parsedJson['countryitems'][0][1]['total_serious_cases'];
}
