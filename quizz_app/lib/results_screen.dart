import 'package:flutter/material.dart';
import 'package:quizz_app/question.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({
    super.key,
    required this.selectedAnswers,
    required this.returnHome,
  });
  final List<String> selectedAnswers;
  final VoidCallback returnHome;

  int puntuationQuizz() {
    int correct = 0;
    for (var i = 0; i < listQuestions.length; i++) {
      if (selectedAnswers[i] == listQuestions[i].answers[0]) {
        correct++;
      }
    }
    return correct;
  }

  @override
  Widget build(BuildContext context) {
    final correctAnswers = puntuationQuizz();

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: RadialGradient(
            colors: [Colors.white, Colors.red],
            radius: 5,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Tus resultados son:",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              SizedBox(
                height: 400,
                width: 380,
                child: SingleChildScrollView(
                  child: Results(selectedAnswers: selectedAnswers),
                ),
              ),
              Text(
                "Puntuación: $correctAnswers de ${listQuestions.length}",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              TextButton.icon(
                onPressed: returnHome,
                icon: Icon(Icons.catching_pokemon),
                label: const Text('Volver al inicio'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Results extends StatelessWidget {
  const Results({super.key, required this.selectedAnswers});

  final List<String> selectedAnswers;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (var i = 0; i < listQuestions.length; i++)
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Pregunta ${i + 1}:",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              Text(
                listQuestions[i].textQuestion,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              Text(
                "Respuesta correcta: ${listQuestions[i].answers[0]}",
                style: TextStyle(fontSize: 19),
              ),
              Text(
                "Respuesta seleccionada: ${selectedAnswers[i]}",
                style: TextStyle(
                  fontSize: 19,
                  color:
                      selectedAnswers[i] == listQuestions[i].answers[0]
                          ? Colors.green
                          : Colors.red,
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
      ],
    );
  }
}
