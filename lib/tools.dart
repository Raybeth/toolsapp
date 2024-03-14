import 'package:flutter/material.dart';

class Tools extends StatelessWidget {
  const Tools({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Aplicación Multifuncional'),
        backgroundColor: const Color.fromRGBO(255, 224, 178, 1),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [Colors.white, Colors.white12],
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            // Agregado para permitir el desplazamiento si es necesario
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset('assets/toolbox.png'),
                const SizedBox(height: 5),
                const Text(
                  'Bienvenido a la Caja de Herramientas!',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 8, 8, 8)),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20), // Espacio adicional antes del menú
                menuNavegacion(context), // Corrección en la llamada de función
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget menuNavegacion(BuildContext context) {
    // Esta función construye el menú de navegación
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const SizedBox(height: 5),
          _buildNavigationButton(context, 'Tu Género', '/genders'),
          _buildNavigationButton(context, 'Tu Edad', '/ages'),
          _buildNavigationButton(context, 'Universidades', '/countries'),
          _buildNavigationButton(context, 'Clima Actual', '/weather'),
          _buildNavigationButton(context, 'WordPress', '/wordpress'),
          _buildNavigationButton(context, 'Contrátame', '/contratame'),
        ],
      ),
    );
  }

  Widget _buildNavigationButton(
      BuildContext context, String title, String route) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: SizedBox(
        width: double
            .infinity, // Esto hará que todos los botones tengan el mismo ancho
        height: 40, // Altura fija para todos los botones
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.black,
            backgroundColor: Color.fromARGB(178, 241, 213, 98),
            shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(0), // Opcional: para bordes redondeados
            ),
            padding: const EdgeInsets.all(8),
          ),
          onPressed: () {
            Navigator.pushNamed(context, route);
          },
          child: Text(
            title,
            style: const TextStyle(fontSize: 18),
          ),
        ),
      ),
    );
  }
}
