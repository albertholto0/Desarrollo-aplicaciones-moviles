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

  void switchScreen(int semestre) {
    setState(() {
      semestreSeleccionado = semestre;
      currentScreen = "ruleta-screen";
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget screen = HomeRuleta(startRuleta: switchScreen);

    if (currentScreen == "ruleta-screen") {
      screen = BodyRuleta(
        semestre: semestreSeleccionado,
        onBack: () {
          setState(() {
            currentScreen = "home-screen";
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
