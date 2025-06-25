import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_waether_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/views/home_view.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWaetherCubit(),
      child: Builder(
        builder: (context) => BlocBuilder<GetWaetherCubit, WeatherState>(
          builder: (context, state) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                primarySwatch: getThemeColor(
                  BlocProvider.of<GetWaetherCubit>(context)
                      .weatherModel
                      ?.weatherCondition,
                ),
              ),
              home: HomeView(),
            );
          },
        ),
      ),
    );
  }
}

MaterialColor getThemeColor(String? condition) {
  if (condition == null) {
    return Colors.teal;
  }

  if (condition == 'Sunny' || condition == 'Clear') {
    return Colors.orange;
  } else if (condition == 'Partly cloudy') {
    return Colors.deepOrange;
  } else if (condition == 'Cloudy' || condition == 'Overcast') {
    return Colors.blueGrey;
  } else if (condition == 'Mist' ||
      condition == 'Blizzard' ||
      condition == 'Fog' ||
      condition == 'Freezing fog') {
    return Colors.grey;
  } else if (condition.contains('rain') ||
      condition.contains('drizzle') ||
      condition.contains('shower')) {
    return Colors.blue;
  } else if (condition.contains('snow') || condition.contains('sleet')) {
    return Colors.lightBlue;
  } else if (condition.contains('ice pellet')) {
    return Colors.cyan;
  } else if (condition.contains('thunder')) {
    return Colors.deepPurple;
  } else if (condition.contains('freezing')) {
    return Colors.indigo;
  } else {
    return Colors.teal;
  }
}
