class Question {
  const Question({required this.textQuestion, required this.answers});

  final String textQuestion;
  final List<String> answers;
  List<String> shuffleAnswers() {
    final copyOfList = List.of(answers);
    copyOfList.shuffle();
    return copyOfList;
  }
}

final listQuestions = [
  Question(
    textQuestion: "¿Qué tipo es Pikachu?",
    answers: ["Eléctrico", "Agua", "Fuego", "Planta"],
  ),
  Question(
    textQuestion: "¿Quién evoluciona de Charmander?",
    answers: ["Charmeleon", "Charizard", "Pikachu", "Bulbasaur"],
  ),
  Question(
    textQuestion: "¿Cuál es el Pokémon número 1 en la Pokédex Nacional?",
    answers: ["Bulbasaur", "Pikachu", "Mewtwo", "Snorlax"],
  ),
  Question(
    textQuestion: "¿Cuál Pokémon es de la región de Kanto?",
    answers: ["Squirtle", "Mudkip"],
  ),
  Question(
    textQuestion: "¿Qué Pokémon es legendario?",
    answers: ["Mewtwo", "Blue", "Rattata"],
  ),
];
