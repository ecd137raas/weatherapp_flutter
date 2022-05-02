import 'package:flutter/material.dart';
import 'package:weather/widgets/Weather_app.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart' as dotenv;

Future main() async {
  await dotenv.dotenv.load(fileName: '.env');
  runApp(WeatherApp());
}
