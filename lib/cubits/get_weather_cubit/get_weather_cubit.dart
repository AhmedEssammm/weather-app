import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_service.dart';

class GetWaetherCubit extends Cubit<WeatherState> {
  GetWaetherCubit() : super(WeatherInitialState());

  WeatherModel? weatherModel;
  getWeather({required String cityName}) async {
    try {
      emit(WeatherLoadingState());

      weatherModel =
          await WeatherService(Dio()).getCurrentWeather(cityName: cityName);
          
      emit(WeatherLoadedState(weatherModel!));
    } catch (e) {
      emit(WeatherErrorState(e.toString().replaceFirst('Exception: ', '')));
    }
  }
}
