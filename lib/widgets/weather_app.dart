import 'package:flutter/material.dart';
import 'package:weather/controllers/tema_controller.dart';
import 'package:weather/widgets/home.dart';

class WeatherApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: TemaController.instance,
      builder: (context, child) {
        return MaterialApp(
          title: 'Previsão do tempo',
          theme: TemaController.instance.usarTemaDark
              ? ThemeData.dark()
              : ThemeData.light(),
          debugShowCheckedModeBanner: false,
          home: Home(),
        );
      },
    );
  }
}
