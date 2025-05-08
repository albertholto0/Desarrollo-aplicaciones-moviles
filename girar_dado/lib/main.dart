import 'package:flutter/material.dart';
import 'dart:math'; // Paquete para manejar números aleatorios
import 'dart:async'; // Parquete para manejar operaciones "asícronas"

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomeDado()); // Se define la pantalla principal
  }
}

class HomeDado extends StatefulWidget {
  const HomeDado({super.key});

  @override
  State<HomeDado> createState() {
    return _HomeDadoState(); // Crea el estado del widget
  }
}

class _HomeDadoState extends State<HomeDado> {
  var _rutaDado = "assets/images/dado1.png"; // Imagen inicial del dado
  var _i = 1; // Número actual del dado
  var _estaAnimado = false; // Controla si la animación está activa
  Future<void> girarDado() async {
    // rutaDado = "assets/images/dado6.png";
    // print("BANDERA: $_estaAnimado");
    if (!_estaAnimado) {
      _estaAnimado = true; // Evita muchas animaciones al mismo tiempo

      // Esta lista define el orden de las imagenes por animación
      List<String> listaDados = [
        "assets/images/dado6.png",
        "assets/images/dado3.png",
        "assets/images/dado2.png",
        "assets/images/dado4.png",
        "assets/images/dado5.png",
        "assets/images/dado1.png",
        "assets/images/dado4.png",
        "assets/images/dado2.png",
        "assets/images/dado5.png",
        "assets/images/dado6.png",
        "assets/images/dado3.png",
        "assets/images/dado2.png",
        "assets/images/dado4.png",
        "assets/images/dado5.png",
        "assets/images/dado1.png",
        "assets/images/dado4.png",
      ];

      var duracion = Duration(milliseconds: 120); // Duración entre imágenes

      for (var dado in listaDados) {
        setState(() {
          _rutaDado = dado; // Actualiza la imagen del dado
        });
        await Future.delayed(duracion); // Espera antes de cambiar
      }

      // await Future.delayed(Duration(milliseconds: 4000));
      setState(() {
        _i =
            Random().nextInt(6) + 1; // Se genera un número aleatorio del 1 al 6
        _rutaDado =
            "assets/images/dado$_i.png"; // Aqui se define la imagen final del dado
      });
      _estaAnimado = false; // Declara que la animación terminó
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: RadialGradient(
            colors: [Colors.yellow, Colors.blue],
            radius: 1.5,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                _rutaDado,
                width: 250,
              ), //Muestra la imagen del dado en pantalla
              SizedBox(height: 50), // Espaciado
              ElevatedButton(
                onPressed:
                    girarDado, // Llama a la funcion "girarDado" al presionar el botón
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  foregroundColor: Colors.black,
                  textStyle: TextStyle(fontSize: 20),
                ),
                child: Text("Girar dado"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
