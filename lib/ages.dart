import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AgesScreen extends StatefulWidget {
  const AgesScreen({Key? key}) : super(key: key);

  @override
  AgesScreenState createState() => AgesScreenState();
}

class AgesScreenState extends State<AgesScreen> {
  final TextEditingController _nameController = TextEditingController();
  String? _ageMessage;
  String? _ageImageUrl;

  void _determineAge() async {
    final response = await http
        .get(Uri.parse('https://api.agify.io/?name=${_nameController.text}'));
    if (response.statusCode == 200) {
      final result = json.decode(response.body);
      final age = result['age']; // Esto puede ser null

      if (age != null) {
        setState(() {
          _ageMessage = _getAgeCategory(age as int);
          _ageImageUrl = _getAgeImage(age);
        });
      } else {
        setState(() {
          _ageMessage = 'Edad no disponible';
          _ageImageUrl = null;
        });
      }
    }
  }

  String _getAgeCategory(int age) {
    if (age < 18) {
      return 'Joven';
    } else if (age < 65) {
      return 'Adulto';
    } else {
      return 'Anciano';
    }
  }

  String _getAgeImage(int age) {
    if (age < 18) {
      return 'assets/young.png'; // Asegúrate de tener esta imagen en tus assets
    } else if (age < 65) {
      return 'assets/adult.png'; // Asegúrate de tener esta imagen en tus assets
    } else {
      return 'assets/elderly.png'; // Asegúrate de tener esta imagen en tus assets
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Determinación de Edad'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Nombre',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: _determineAge,
            child: const Text('Determinar Edad'),
          ),
          if (_ageMessage != null) ...[
            Text('Categoría de Edad: $_ageMessage'),
            if (_ageImageUrl != null) Image.asset(_ageImageUrl!),
          ],
        ],
      ),
    );
  }
}
