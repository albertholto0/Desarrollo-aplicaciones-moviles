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
    Question currentQuestion = listQuestions[_questionNumber];
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            height: 10,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 6,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: LinearProgressIndicator(
              borderRadius: BorderRadius.circular(12),
              value: (_questionNumber + 1) / listQuestions.length,
              color: Colors.red,
              backgroundColor: Colors.grey[100],
              minHeight: 10,
            ),
          ),
          Expanded(
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
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
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
                              color: const Color.fromARGB(255, 108, 37, 37),
                            ),
                          ),
                        ),
                      ],
                    );
                  }),
                  //Image.asset('assets/gifs/gengar.gif', height: 150),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
