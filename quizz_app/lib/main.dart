import 'package:flutter/material.dart';
import 'package:quizz_app/question.dart';
import 'package:quizz_app/quizz_body.dart';
import 'package:quizz_app/results_screen.dart';

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
  String currentScreen = "home-screen";
  final List<String> selectedAnswers = [];
  // @override
  // // void initState() {
  // //   currentScreen = HomeQuizz(startQuiz: SwitchScreen);
  // //   super.initState();
  // // }

  //CAMBIO DE ESTADO y se mostrá el segundo widget
  void switchScreen() {
    setState(() {
      currentScreen = "question-screen";
      selectedAnswers.clear();
    });
  }

  void addSelectedAsnwers(String answer) {
    selectedAnswers.add(answer);
    print(selectedAnswers);

    if (selectedAnswers.length == listQuestions.length) {
      setState(() {
        currentScreen = "results-screen";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    //Widget currentScreen=HomeSimple(startQuiz: SwitchScreen,);
    Widget screen = HomeQuizz(startQuiz: switchScreen);
    // Widget screen = ResultsScreen();
    if (currentScreen == "question-screen") {
      screen = QuizzBody(addSelectedAnswer: addSelectedAsnwers);
    }
    if (currentScreen == "results-screen") {
      screen = ResultsScreen(selectedAnswers: selectedAnswers);
    }
    return MaterialApp(
      theme: ThemeData(
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
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/pokeball.png', width: 250),
              const SizedBox(height: 30),
              // Botón elevated
              TextButton.icon(
                onPressed: startQuiz,
                icon: Icon(Icons.play_arrow_rounded),
                label: const Text('Iniciar Quizz'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/**SATEFULWIDGET 
 class HomeSimple extends StatefulWidget {
  const HomeSimple({super.key});
  @override
  State<HomeSimple> createState() {
    return _HomeSimpleState();
  }
}

class _HomeSimpleState extends State<HomeSimple> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/pino.png', width: 250),
              const SizedBox(height: 30),
              // Botón elevated
              TextButton.icon(
                onPressed: () {},
                icon: Icon(Icons.terrain_rounded),
                label: const Text('Iniciar'),
              ),
*/
