import 'package:dio/dio.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherService {
  final Dio dio;
  final String baseUrl = 'http://api.weatherapi.com/v1';
  final String apiKey = 'fe2b45a16cb741fcb88221305252306';

  WeatherService(this.dio);
  Future<WeatherModel> getCurrentWeather({required String cityName}) async {
    try {
      Response response = await dio
          .get('$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1');

      WeatherModel weatherModel = WeatherModel.fromJson(response.data);

      return weatherModel;
    } on DioException catch (e) {
      final errorCode = e.response?.statusCode;
      final apiMessage = e.response?.data['error']?['message'];

      String userFriendlyMessage;

      if (errorCode == 400) {
        userFriendlyMessage = 'Please enter a valid city name.';
      } else if (errorCode == 401 || errorCode == 403) {
        userFriendlyMessage = 'Invalid API key or unauthorized access.';
      } else if (errorCode == 404) {
        userFriendlyMessage = 'City not found. Please try again.';
      } else if (errorCode == 429) {
        userFriendlyMessage =
            'You’ve made too many requests. Please wait a bit.';
      } else {
        userFriendlyMessage =
            apiMessage ?? 'Oops! Something went wrong. Please try again later.';
      }

      throw Exception(userFriendlyMessage);
    } catch (e) {
      throw Exception(
          'Oops! Something went wrong. Please check your connection and try again.');
    }
  }
}
