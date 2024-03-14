import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
//

class CountriesScreen extends StatefulWidget {
  const CountriesScreen({Key? key}) : super(key: key);

  @override
  CountriesScreenState createState() => CountriesScreenState();
}

class CountriesScreenState extends State<CountriesScreen> {
  final TextEditingController _countryController = TextEditingController();
  List _universities = [];

  Future<void> _searchUniversities() async {
    var response = await http.get(Uri.parse(
        'http://universities.hipolabs.com/search?country=${_countryController.text}'));

    if (response.statusCode == 200) {
      setState(() {
        _universities = json.decode(response.body);
      });
    } else {
      // Manejar el error
      print('Error al buscar universidades: ${response.statusCode}');
    }
  }

  //Future<void> _launchURL(String urlString) async {
  // final Uri url = Uri.parse(urlString);
  //   if (await canLaunchUrl(url)) {
  //    await launchUrl(url);
  //} else {
//      // Manejar el error
//print('No se pudo lanzar $urlString');
//}
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Universidades por País'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: TextField(
              controller: _countryController,
              decoration: const InputDecoration(
                labelText: 'Nombre del País',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: _searchUniversities,
            child: const Text('Buscar Universidades'),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _universities.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_universities[index]['name'] ?? 'No disponible'),
                  subtitle: Text(_universities[index]['domains']?.join(', ') ??
                      'No disponible'),
                  onTap: () {
                    String? url = _universities[index]['web_pages']?.first;
                    if (url != null) {
                      //    _launchURL(url);
                    }
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
