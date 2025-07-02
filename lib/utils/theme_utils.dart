import 'package:flutter/material.dart';

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
