import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';

void searchCity(BuildContext context, String value) {
    if (value.trim().isEmpty) return;
    final getWeatherCubit = BlocProvider.of<GetWaetherCubit>(context);
    getWeatherCubit.getWeather(cityName: value.trim());
    Navigator.pop(context);
  }