import 'package:flutter/material.dart';
import 'package:quizz_app/question.dart';

class QuizzBody extends StatefulWidget {
  const QuizzBody({super.key, required this.addSelectedAnswer});
  final void Function(String) addSelectedAnswer;

  @override
  State<QuizzBody> createState() => _QuizzBodyState();
}

class _QuizzBodyState extends State<QuizzBody> {
  int _questionNumber = 0; // Índice de la pregunta en la que nos encontramos
  void onSelectedAnswer(String answer) {
    widget.addSelectedAnswer(answer);
    setState(() {
      _questionNumber++; // Se avanza a la siguiente pregunta
    });
  }

  @override
  Widget build(BuildContext context) {
    // Se obtiene la pregunta actual basada en el índice
    Question currentQuestion = listQuestions[_questionNumber];
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(30),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsets.all(30),
                  child: Text(
                    currentQuestion.textQuestion,
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              ...currentQuestion.shuffleAnswers().map((answer) {
                return Column(
                  children: [
                    SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {
                        onSelectedAnswer(answer);
                      },
                      child: Text(
                        answer,
                        style: TextStyle(
                          fontSize: 20,
                          color: const Color.fromARGB(255, 37, 77, 108),
                        ),
                      ),
                    ),
                  ],
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
