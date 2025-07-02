class WeatherModel {
  final String cityName;
  final DateTime date;
  final String image;
  final double temp;
  final double maxTemp;
  final double minTemp;
  final String weatherCondition;
  final double? feelsLike;
  final int? humidity;
  final double? windSpeed;
  final double? visibility;

  WeatherModel({
    required this.cityName,
    required this.date,
    required this.image,
    required this.temp,
    required this.maxTemp,
    required this.minTemp,
    required this.weatherCondition,
    this.feelsLike,
    this.humidity,
    this.windSpeed,
    this.visibility,
  });

  String get localImage {
    final condition = weatherCondition.toLowerCase();

    if (condition.contains('clear') || condition.contains('sunny')) {
      return 'assets/images/clear.png';
    } else if (condition.contains('cloud') ||
        condition == 'overcast' ||
        condition == 'partly cloudy') {
      return 'assets/images/cloudy.png';
    } else if (condition.contains('rain') ||
        condition.contains('drizzle') ||
        condition.contains('shower')) {
      return 'assets/images/rainy.png';
    } else if (condition.contains('snow') ||
        condition.contains('sleet') ||
        condition.contains('ice pellet') ||
        condition.contains('freezing')) {
      return 'assets/images/snow.png';
    } else if (condition.contains('thunder')) {
      return 'assets/images/thunderstorm.png';
    } else if (condition == 'blizzard' ||
        condition.contains('fog') ||
        condition.contains('freezing fog') ||
        condition.contains('mist') ||
        condition.contains('haze')) {
      return 'assets/images/fog.png';
    } else {
      return 'assets/images/clear.png';
    }
  }

  factory WeatherModel.fromJson(json) {
    return WeatherModel(
      cityName: json['location']['name'],
      date: DateTime.parse(json['current']['last_updated']),
      temp: json['forecast']['forecastday'][0]['day']['avgtemp_c'],
      maxTemp: json['forecast']['forecastday'][0]['day']['maxtemp_c'],
      minTemp: json['forecast']['forecastday'][0]['day']['mintemp_c'],
      weatherCondition: json['forecast']['forecastday'][0]['day']['condition']
          ['text'],
      image: json['forecast']['forecastday'][0]['day']['condition']['icon'],
      feelsLike: json['current']['feelslike_c'],
      humidity: json['current']['humidity'],
      windSpeed: json['current']['wind_kph'],
      visibility: json['current']['vis_km'],
    );
  }
}
