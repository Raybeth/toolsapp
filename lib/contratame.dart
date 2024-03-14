import 'package:flutter/material.dart';

class ContratameScreen extends StatelessWidget {
  const ContratameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contratame', style: TextStyle(color: Colors.white)),
        backgroundColor: const Color.fromARGB(234, 75, 10, 2),
      ),
      body: Center(
        child: Card(
          elevation: 4.0,
          margin: const EdgeInsets.all(16.0),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize:
                  MainAxisSize.min, // Para que el Card se ajuste al contenido
              children: <Widget>[
                const CircleAvatar(
                  radius: 50.0,
                  backgroundImage: AssetImage(
                      'assets/evophoto.png'), // Asegúrate de tener una foto tuya en assets
                ),
                const SizedBox(height: 16.0),
                const Text(
                  "Lisbeth Jimenez",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8.0),
                const Text(
                  "Desarrollador de Flutter",
                  style: TextStyle(fontSize: 18, fontStyle: FontStyle.italic),
                ),
                const SizedBox(height: 16.0),
                const Text(
                  "Contacto:\n20220790@itla.edu.do\n+849 260 7783",
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    IconButton(
                      icon: const Icon(Icons.email),
                      onPressed: () {
                        // Agrega la funcionalidad para enviar un email
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.phone),
                      onPressed: () {
                        // Agrega la funcionalidad para hacer una llamada
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.web),
                      onPressed: () {
                        // Agrega la funcionalidad para abrir tu sitio web o portfolio
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
