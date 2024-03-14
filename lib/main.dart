import 'package:flutter/material.dart';
import 'tools.dart';
import 'genders.dart';
import 'ages.dart';
import 'contries.dart';
import 'weather.dart';
import 'wordpress.dart';
import 'contratame.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tools Application',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const Tools(),
      routes: {
        '/tools': (context) => const Tools(),
        '/genders': (context) => const GenderPredictionScreen(),
        '/ages': (context) => const AgesScreen(),
        '/countries': (context) => const CountriesScreen(),
        '/weather': (context) => const WeatherScreen(),
        '/wordpress': (context) => const WordPressNewsScreen(),
        '/contratame': (context) => const ContratameScreen(),
      },
    );
  }
}
