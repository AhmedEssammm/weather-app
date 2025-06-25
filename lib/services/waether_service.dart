import 'package:dio/dio.dart';
import 'package:weather_app/models/weather_model.dart';

class WaetherService {
  final Dio dio;
  final String baseUrl = 'http://api.weatherapi.com/v1';
  final String apiKey = 'fe2b45a16cb741fcb88221305252306';

  WaetherService(this.dio);
  Future<WeatherModel> getCurrentWeather({required String cityName}) async {
    try {
      Response response = await dio
          .get('$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1');

      WeatherModel weatherModel = WeatherModel.fromJson(response.data);

      return weatherModel;
    } on DioException catch (e) {
      final String errorMessage = e.response?.data['error']['message'] ??
          'Opsss... there is an error, try again!';
      throw Exception(errorMessage);
    } catch (e) {
      throw Exception('Opsss... there is an error, try again!');
    }
  }
}
