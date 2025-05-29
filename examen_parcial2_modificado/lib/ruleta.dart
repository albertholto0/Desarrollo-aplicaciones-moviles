import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:async';

// divide en dos partes
class BodyRuleta extends StatefulWidget {
  final int semestre;
  final VoidCallback onBack;
  const BodyRuleta({super.key, required this.semestre, required this.onBack});

  @override
  State<BodyRuleta> createState() => _BodyRuletaState();
}

class _BodyRuletaState extends State<BodyRuleta> {
  late String _rutaDado;
  late String nombreGanador = "";
  late String nombreGrupo = "";
  // Nombre del semestre
  final Map<int, String> nombreSemestre = {
    2: "203",
    4: "403",
    6: "603",
    8: "803",
    10: "1003",
  };
  // Mapeo de la cantidad de alumnos por semestres
  final Map<int, int> alumnosPorSemestre = {2: 19, 4: 11, 6: 7, 8: 7, 10: 3};
  // Mapeo de los nombres de alumnos por semestre y número.
  final Map<int, Map<int, String>> nombresAlumnos = {
    2: {
      1: "Alexander",
      2: "Ailed",
      3: "Lizbeth",
      4: "Lidia",
      5: "Monserrat",
      6: "Iris",
      7: "Ana",
      8: "Jairo",
      9: "Alexis",
      10: "Miguel",
      11: "Armando",
      12: "Aldo",
      13: "Luis",
      14: "Angel",
      15: "Jaziel",
      16: "Kevin",
      17: "Roberto",
      18: "Viviana",
      19: "Mikal",
    },

    4: {
      1: "Bryan",
      2: "Yamileth",
      3: "Héctor",
      4: "Alberto",
      5: "Adi",
      6: "Juan",
      7: "Rebecca",
      8: "Rosalinda",
      9: "Jennifer",
      10: "Patricia",
      11: "Galilea",
    },
    6: {
      1: "Albert",
      2: "Amelia",
      3: "Edén",
      4: "Elton",
      5: "Kevin",
      6: "Sergio",
      7: "Diana",
    },
    8: {
      1: "Efrén",
      2: "Gabriela",
      3: "Yenisleydis",
      4: "Huicho",
      5: "Luis",
      6: "Nayeli",
      7: "Ramiro",
    },
    10: {1: "Alba", 2: "Adair", 3: "Aldair"},
  };
  @override
  void initState() {
    super.initState();
    // Inicializa con la primera imagen
    _rutaDado = "assets/images/semestre${widget.semestre}/cara1.jpg";
    nombreGrupo = nombreSemestre[widget.semestre]!;
  }

  var _estaAnimado = false; // Esto evita animaciones simultaneas

  // Función para animar la selección del alumno
  Future<void> girarDado() async {
    if (!_estaAnimado) {
      _estaAnimado = true;
      int total = alumnosPorSemestre[widget.semestre]!;

      var duracion = Duration(milliseconds: 80);

      // Esta es una animación, que simula un ciclo rapido por todas las imagenes
      for (var i = 1; i <= total; i++) {
        setState(() {
          _rutaDado = "assets/images/semestre${widget.semestre}/cara$i.jpg";
        });
        await Future.delayed(duracion);
      }

      // Selección final aleatoria del alumno
      setState(() {
        int ganador = Random().nextInt(total) + 1;
        _rutaDado = "assets/images/semestre${widget.semestre}/cara$ganador.jpg";
        nombreGanador =
            nombresAlumnos[widget.semestre]?[ganador] ?? "Sin nombre";
      });
      _estaAnimado = false;
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
              Color.fromARGB(255, 182, 208, 240),
            ],
            radius: 1.5,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Grupo ",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    nombreGrupo,
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      shadows: [
                        Shadow(
                          blurRadius: 10,
                          color: const Color.fromARGB(255, 96, 107, 161),
                          offset: Offset(0, 0),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
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
                child: Image.asset(_rutaDado, width: 220),
              ),
              SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Ganador: ",
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    nombreGanador,
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      shadows: [
                        Shadow(
                          blurRadius: 10,
                          color: Colors.indigo.shade300,
                          offset: Offset(0, 0),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 25),
              ElevatedButton.icon(
                onPressed: girarDado,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 98, 142, 204),
                  foregroundColor: const Color.fromARGB(255, 255, 255, 255),
                  textStyle: TextStyle(fontSize: 20),
                ),
                icon: Icon(Icons.play_circle_filled),
                label: Text("Seleccionar ganador"),
              ),
              SizedBox(height: 15),
              ElevatedButton.icon(
                onPressed: widget.onBack,
                icon: Icon(Icons.home),
                label: Text("Regresar a inicio"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
