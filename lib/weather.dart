import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({Key? key}) : super(key: key);

  @override
  WeatherScreenState createState() => WeatherScreenState();
}

class WeatherScreenState extends State<WeatherScreen> {
  String _weather = 'Cargando...';

  @override
  void initState() {
    super.initState();
    _fetchWeather();
  }

  Future<void> _fetchWeather() async {
    var url = Uri.parse(
        'http://api.openweathermap.org/data/2.5/weather?q=Santo+Domingo,DO&appid=TU_CLAVE_API&units=metric');
    var response = await http.get(url);

    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      setState(() {
        _weather =
            "${data['main']['temp']}°C, ${data['weather'][0]['description']}";
      });
    } else {
      setState(() {
        _weather = 'Error al obtener el clima';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Clima en RD'),
      ),
      body: Center(
        child: Text(_weather, style: const TextStyle(fontSize: 24)),
      ),
    );
  }
}
