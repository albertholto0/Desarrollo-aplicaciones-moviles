import 'package:flutter/material.dart';
import 'package:quizz_app/question.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({super.key, required this.selectedAnswers});
  final List<String> selectedAnswers;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Tus resultados son:", style: TextStyle(fontSize: 30)),
            SizedBox(height: 20),
            Text(
              "Pregunta 1: ${listQuestions[0].textQuestion}",
              style: TextStyle(fontSize: 20),
            ),
            Text(
              "Respuesta correcta: ${listQuestions[0].answers[0]}",
              style: TextStyle(fontSize: 20),
            ),
            Text(
              "Respuesta seleccionada: ${selectedAnswers[0]}",
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            TextButton.icon(
              onPressed: () {},
              icon: Icon(Icons.catching_pokemon),
              label: const Text('Volver al inicio'),
            ),
          ],
        ),
      ),
    );
  }
}
