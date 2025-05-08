import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:async';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  //Metodo de constructor
  const MyApp({super.key});

  //Metodo para construir un widget
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomeDado());
  }
}

// divide en dos partes
class HomeDado extends StatefulWidget {
  const HomeDado({super.key});
  @override
  State<HomeDado> createState() {
    return _HomeDadoState();
  }
}

//"_" nomenclaura de variables privadas
class _HomeDadoState extends State<HomeDado> {
  var _rutaDado = "assets/images/sexto/cara1.jpg";
  var _i = 1;
  var _estaAnimado = false;
  Future<void> girarDado() async {
    //print("Bandera $_estaAnimado" );
    if (!_estaAnimado) {
      _estaAnimado = true;

      List<String> listaDados = [
        "assets/images/sexto/cara1.jpg",
        "assets/images/sexto/cara2.jpg",
        "assets/images/sexto/cara3.jpg",
        "assets/images/sexto/cara4.jpg",
        "assets/images/sexto/cara5.jpg",
        "assets/images/sexto/cara6.jpg",
      ];

      var duracion = Duration(milliseconds: 80);

      for (var dado in listaDados) {
        setState(() {
          _rutaDado = dado;
        });
        await Future.delayed(duracion);
      }

      setState(() {
        _i = Random().nextInt(6) + 1;
        _rutaDado = "assets/images/sexto/cara$_i.jpg";
      });
      _estaAnimado = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: Color.fromARGB(255, 182, 208, 240)),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(_rutaDado, width: 220),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: girarDado,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 98, 142, 204),
                  foregroundColor: const Color.fromARGB(255, 255, 255, 255),
                  textStyle: TextStyle(fontSize: 20),
                ),
                child: Text("Seleccionar ganador"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
