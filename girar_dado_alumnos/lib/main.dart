import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart'; // Paquete que permite usar fuentes personalizadas
import 'dart:math'; // Paquete para generar números aleatorios
import 'dart:async'; // Paquete para manejar operaciones asíncronas

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomeDado());
  }
}

class HomeDado extends StatefulWidget {
  const HomeDado({super.key});

  @override
  State<HomeDado> createState() {
    return _HomeDadoState();
  }
}

class _HomeDadoState extends State<HomeDado> {
  var _rutaCompanero =
      "assets/companeros/companero1.jpeg"; // Imagen inicial del compañero
  var _i = 1; //Índice para seleccionar las imágenes
  var _estaAnimado = false; //Controla si la animación está activa
  Future<void> girarDado() async {
    if (!_estaAnimado) {
      _estaAnimado = true; // Evita multiples animaciones simultáneas

      // Esta lista muestra las imagenes de mis compañeros durante la animación
      List<String> listaCompaneros = [
        "assets/companeros/companero2.jpeg",
        "assets/companeros/companero1.jpeg",
        "assets/companeros/companero3.jpeg",
        "assets/companeros/companero4.jpeg",
        "assets/companeros/companero6.jpeg",
        "assets/companeros/companero5.jpeg",
        "assets/companeros/companero7.jpeg",
        "assets/companeros/companero2.jpeg",
        "assets/companeros/companero1.jpeg",
        "assets/companeros/companero3.jpeg",
        "assets/companeros/companero4.jpeg",
        "assets/companeros/companero6.jpeg",
        "assets/companeros/companero5.jpeg",
        "assets/companeros/companero7.jpeg",
        "assets/companeros/companero6.jpeg",
        "assets/companeros/companero5.jpeg",
        "assets/companeros/companero7.jpeg",
      ];

      // Duración de la animación entre cada imagen
      var duracion = Duration(milliseconds: 80);

      // Recorre toda la lista de las imágenes y actualiza la vista
      for (var companero in listaCompaneros) {
        setState(() {
          _rutaCompanero = companero; // Cambia la imagen mostrada
        });
        await Future.delayed(
          duracion,
        ); // Espera antes de cambiar a la siguiente imagen
      }

      setState(() {
        _i =
            Random().nextInt(6) +
            1; //Selecciona una de las imagenes de mis compañeros al azar
        _rutaCompanero = "assets/companeros/companero$_i.jpeg";
      });
      _estaAnimado = false; // Marca el fin de la animación
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: RadialGradient(
            colors: [
              const Color.fromARGB(255, 255, 255, 255),
              const Color.fromARGB(255, 243, 138, 33),
            ],
            radius: 1.5,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(30),
                child: Text(
                  "Ruleta 603",
                  style: GoogleFonts.nunito(
                    textStyle: TextStyle(
                      fontSize: 35,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.black, width: 5),
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      offset: Offset(0, 2),
                      blurRadius: 5,
                      spreadRadius: 1,
                    ),
                  ],
                ),
                padding: EdgeInsets.all(5),
                child: Image.asset(_rutaCompanero, width: 250),
              ),
              SizedBox(height: 50),
              ElevatedButton(
                onPressed: girarDado,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  foregroundColor: Colors.black,
                  textStyle: TextStyle(fontSize: 20),
                ),
                child: Text(
                  "Escoger al azar",
                  style: GoogleFonts.nunito(
                    textStyle: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
