import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:async';

// divide en dos partes
class BodyRuleta extends StatefulWidget {
  const BodyRuleta({super.key});
  @override
  State<BodyRuleta> createState() => _BodyRuletaState();
}

//"_" nomenclaura de variables privadas
class _BodyRuletaState extends State<BodyRuleta> {
  final _semestre = 6;
  late String _rutaDado;

  @override
  void initState() {
    super.initState();
    _rutaDado = "assets/images/semestre$_semestre/cara1.jpg";
  }

  var _i = 1;
  var _estaAnimado = false;
  Future<void> girarDado() async {
    //print("Bandera $_estaAnimado" );
    if (!_estaAnimado) {
      _estaAnimado = true;

      List<String> listaDados = [
        "assets/images/semestre$_semestre/cara1.jpg",
        "assets/images/semestre$_semestre/cara2.jpg",
        "assets/images/semestre$_semestre/cara3.jpg",
        "assets/images/semestre$_semestre/cara4.jpg",
        "assets/images/semestre$_semestre/cara5.jpg",
        "assets/images/semestre$_semestre/cara6.jpg",
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
        _rutaDado = "assets/images/semestre$_semestre/cara$_i.jpg";
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
