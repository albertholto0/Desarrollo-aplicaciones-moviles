import 'package:flutter/material.dart';
import 'package:quizz_app/question.dart';
import 'package:quizz_app/quizz_body.dart';
import 'package:quizz_app/results_screen.dart';
import 'package:google_fonts/google_fonts.dart';

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
  // Este es el metodo uno
  // Widget? currentScreen;
  String currentScreen = "home-screen"; // Controla que pantalla se muestra
  final List<String> selectedAnswers = [];
  // @override
  // // void initState() {
  // //   currentScreen = HomeQuizz(startQuiz: SwitchScreen);
  // //   super.initState();
  // // }
  void returnHome() {
    setState(() {
      currentScreen = "home-screen";
    });
  }

  //CAMBIO DE ESTADO y se mostrá el segundo widget. Muestra la pantall de preguntas y limpia la respuestas seleccionadas
  void switchScreen() {
    setState(() {
      currentScreen = "question-screen";
      selectedAnswers.clear();
    });
  }

  // Agrega una respuesta a la lista de respuestas seleccionadas
  void addSelectedAsnwers(String answer) {
    selectedAnswers.add(answer);
    print(selectedAnswers);

    // Verifica si se han respondido todas las preguntas,
    // comparando si el número de respuestas es igual al número total de preguntas
    if (selectedAnswers.length == listQuestions.length) {
      setState(() {
        // Si se han respondido todas, cambia a la pantalla de resultados
        currentScreen = "results-screen";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // Determina que pantalla mostrar según el estado actual
    //Widget currentScreen=HomeSimple(startQuiz: SwitchScreen,);
    Widget screen = HomeQuizz(startQuiz: switchScreen);
    // Widget screen = ResultsScreen();
    if (currentScreen == "question-screen") {
      screen = QuizzBody(addSelectedAnswer: addSelectedAsnwers);
    }
    if (currentScreen == "results-screen") {
      screen = ResultsScreen(
        selectedAnswers: selectedAnswers,
        returnHome: returnHome,
      );
    }
    // Se configura el tema de la aplicación
    return MaterialApp(
      theme: ThemeData(
        textTheme: GoogleFonts.nunitoTextTheme(),
        scaffoldBackgroundColor: (const Color.fromARGB(255, 192, 220, 255)),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            backgroundColor: Color.fromARGB(95, 106, 180, 255),
            foregroundColor: Color.fromARGB(255, 18, 24, 71),
            textStyle: TextStyle(fontSize: 20),
            iconSize: 30,
            iconColor: const Color.fromARGB(255, 34, 39, 84),
          ),
        ),
      ),
      home: screen,
    );
  }
}

class HomeQuizz extends StatelessWidget {
  const HomeQuizz({super.key, required this.startQuiz});
  //recibiendo->
  final void Function() startQuiz;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "¿Qué tanto sabes sobre Pokémon?",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Image.asset('assets/images/pokeball.png', width: 250),
            const SizedBox(height: 30),
            // Botón elevated
            TextButton.icon(
              onPressed: startQuiz,
              icon: Icon(Icons.play_arrow_rounded),
              label: Text('Iniciar Quizz'),
            ),
          ],
        ),
      ),
    );
  }
}
