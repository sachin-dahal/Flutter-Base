import 'location.dart';
import 'package:weatherapp/services/networking.dart';

const apiKey = '869aecdf0851a7f44975852c372ccd2d';
const openWeatherMapUrl = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel{

  Future<dynamic> getWeatherInfo() async {

    Location loc = new Location();
    await loc.getLocation();
    print(loc.longitude);
    print(loc.latitude);

    NetworkHelper networkHelper = NetworkHelper(url: '$openWeatherMapUrl?lat=${loc.latitude}&lon=${loc.longitude}&appid=$apiKey&units=metric');
    var weatherData = await networkHelper.getData();

    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'Hello Beautiful People!\nIt\'s 🍦 time';
    } else if (temp > 20) {
      return 'Hello Beautiful People!\nTime for shorts and 👕';
    } else if (temp < 10) {
      return 'Hello Beautiful People!\nYou\'ll need 🧣 and 🧤';
    } else {
      return 'Hello Beautiful People!\nBring a 🧥 just in case';
    }
  }
}