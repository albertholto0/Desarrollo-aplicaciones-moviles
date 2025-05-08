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

  void switchScreen() {
    setState(() {
      currentScreen = "ruleta-screen";
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget screen = HomeRuleta(startRuleta: switchScreen);

    if (currentScreen == "ruleta-screen") {
      screen = BodyRuleta();
    }
    return MaterialApp(home: screen);
  }
}

class HomeRuleta extends StatelessWidget {
  const HomeRuleta({super.key, required this.startRuleta});

  final void Function() startRuleta;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 182, 208, 240),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: startRuleta,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 98, 142, 204),
                    foregroundColor: const Color.fromARGB(255, 255, 255, 255),
                    textStyle: const TextStyle(fontSize: 20),
                  ),
                  child: const Text("2° SEMESTRE"),
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: startRuleta,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 98, 142, 204),
                    foregroundColor: const Color.fromARGB(255, 255, 255, 255),
                    textStyle: const TextStyle(fontSize: 20),
                  ),
                  child: const Text("4° SEMESTRE"),
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: startRuleta,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 98, 142, 204),
                    foregroundColor: const Color.fromARGB(255, 255, 255, 255),
                    textStyle: const TextStyle(fontSize: 20),
                  ),
                  child: const Text("6° SEMESTRE"),
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: startRuleta,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 98, 142, 204),
                    foregroundColor: const Color.fromARGB(255, 255, 255, 255),
                    textStyle: const TextStyle(fontSize: 20),
                  ),
                  child: const Text("8° SEMESTRE"),
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: startRuleta,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 98, 142, 204),
                    foregroundColor: const Color.fromARGB(255, 255, 255, 255),
                    textStyle: const TextStyle(fontSize: 20),
                  ),
                  child: const Text("10° SEMESTRE"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
