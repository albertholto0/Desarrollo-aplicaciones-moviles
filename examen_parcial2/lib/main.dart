import 'package:flutter/material.dart';
import 'package:examen_parcial2/ruleta.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  String currentScreen = "home-screen";
  int semestreSeleccionado = 0;

  // Función para cambiar a la pantalla de ruleta
  void switchScreen(int semestre) {
    setState(() {
      semestreSeleccionado = semestre;
      currentScreen = "ruleta-screen";
    });
  }

  @override
  Widget build(BuildContext context) {
    // Pantalla inicial por defecto
    Widget screen = HomeRuleta(startRuleta: switchScreen);

    // Cambia a la ruleta si corresponde
    if (currentScreen == "ruleta-screen") {
      screen = BodyRuleta(
        semestre: semestreSeleccionado,
        /**
         * onBack nos ayuda a regresar a la pantalla inicio.  
         */
        onBack: () {
          setState(() {
            currentScreen = "home";
          });
        },
      );
    }
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: (const Color.fromARGB(255, 182, 208, 240)),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 98, 142, 204),
            foregroundColor: const Color.fromARGB(255, 255, 255, 255),
            textStyle: const TextStyle(fontSize: 20),
          ),
        ),
      ),
      home: screen,
    );
  }
}

class HomeRuleta extends StatelessWidget {
  const HomeRuleta({super.key, required this.startRuleta});

  final void Function(int) startRuleta;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            /**
             * Dentro de esta columna se definen los botónes para cada semestre. 
             * La función manda el número de semestre que corresponde al botón,
             * y este número se ocupa en la clase BodyRuleta. 
             */
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  startRuleta(2);
                },
                child: Text("2° SEMESTRE"),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  startRuleta(4);
                },
                child: Text("4° SEMESTRE"),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  startRuleta(6);
                },
                child: Text("6° SEMESTRE"),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  startRuleta(8);
                },
                child: Text("8° SEMESTRE"),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  startRuleta(10);
                },
                child: Text("10° SEMESTRE"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
