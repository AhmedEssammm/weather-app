import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/utils/theme_utils.dart';
import 'package:weather_app/widgets/weather_info_tile.dart';

class WeatherInfoBody extends StatelessWidget {
  const WeatherInfoBody({super.key, required this.weather});

  final WeatherModel weather;

  @override
  Widget build(BuildContext context) {
    final weatherModel =
        BlocProvider.of<GetWaetherCubit>(context).weatherModel!;
    final primaryColor = getThemeColor(weatherModel.weatherCondition);

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [primaryColor[700]!, primaryColor[300]!],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
        ),
      ),
      child: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(32),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                  child: Container(
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(32),
                      border: Border.all(color: Colors.white.withOpacity(0.2)),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          weatherModel.cityName,
                          style: const TextStyle(
                            fontSize: 36,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Updated at ${weatherModel.date.hour}:${weatherModel.date.minute.toString().padLeft(2, '0')}',
                          style: const TextStyle(color: Colors.white70),
                        ),

                        const SizedBox(height: 24),

                        Image.asset(
                          weather.localImage,
                          width: 100,
                          height: 100,
                        ),
                        const SizedBox(height: 12),
                        Text(
                          '${weatherModel.temp.round()}°C',
                          style: const TextStyle(
                            fontSize: 48,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          weatherModel.weatherCondition,
                          style: const TextStyle(
                            fontSize: 22,
                            color: Colors.white70,
                            fontWeight: FontWeight.w500,
                          ),
                        ),

                        const SizedBox(height: 32),

                        Wrap(
                          alignment: WrapAlignment.spaceEvenly,
                          runAlignment: WrapAlignment.spaceEvenly,
                          spacing: 32,
                          runSpacing: 24,
                          children: [
                            InfoTile(
                              icon: Icons.thermostat,
                              label: 'Feels Like',
                              value:
                                  '${weatherModel.feelsLike?.round() ?? '-'}°',
                            ),
                            InfoTile(
                              icon: Icons.water_drop,
                              label: 'Humidity',
                              value: '${weatherModel.humidity ?? '-'}%',
                            ),
                            InfoTile(
                              icon: Icons.air,
                              label: 'Wind',
                              value:
                                  '${weatherModel.windSpeed?.round() ?? '-'} km/h',
                            ),
                            InfoTile(
                              icon: Icons.visibility,
                              label: 'Visibility',
                              value:
                                  '${weatherModel.visibility?.round() ?? '-'} km',
                            ),
                            InfoTile(
                              icon: Icons.arrow_upward,
                              label: 'Max Temp',
                              value: '${weatherModel.maxTemp.round()}°',
                            ),
                            InfoTile(
                              icon: Icons.arrow_downward,
                              label: 'Min Temp',
                              value: '${weatherModel.minTemp.round()}°',
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
