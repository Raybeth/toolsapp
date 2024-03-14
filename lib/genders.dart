import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:confetti/confetti.dart';

class GenderPredictionScreen extends StatefulWidget {
  const GenderPredictionScreen({super.key});

  @override
  GenderPredictionScreenState createState() => GenderPredictionScreenState();
}

class GenderPredictionScreenState extends State<GenderPredictionScreen> {
  final TextEditingController _nameController = TextEditingController();
  final ConfettiController _confettiControllerMale =
      ConfettiController(duration: const Duration(seconds: 2));
  final ConfettiController _confettiControllerFemale =
      ConfettiController(duration: const Duration(seconds: 2));

  @override
  void dispose() {
    _nameController.dispose();
    _confettiControllerMale.dispose();
    _confettiControllerFemale.dispose();
    super.dispose();
  }

  void _predictGender() async {
    final response = await http.get(
        Uri.parse('https://api.genderize.io/?name=${_nameController.text}'));
    if (response.statusCode == 200) {
      final result = json.decode(response.body);
      if (result['gender'] == 'male') {
        _confettiControllerMale.play();
      } else if (result['gender'] == 'female') {
        _confettiControllerFemale.play();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Predicción de Género')),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: ConfettiWidget(
              confettiController: _confettiControllerMale,
              blastDirection: 0,
              maxBlastForce: 5,
              minBlastForce: 2,
              numberOfParticles: 50,
              colors: const [Colors.blue, Colors.lightBlueAccent],
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: ConfettiWidget(
              confettiController: _confettiControllerFemale,
              blastDirection: 0,
              maxBlastForce: 5,
              minBlastForce: 2,
              numberOfParticles: 50,
              colors: const [Colors.pink, Colors.pinkAccent],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
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
                onPressed: _predictGender,
                child: const Text('Predecir Género'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
