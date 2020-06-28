enum Difficulty { easy, medium, hard }

class Question {
  final String categoryName;
  final Difficulty difficulty;
  final String question;
  final String correctAnswer;

  Question(
      {this.categoryName, this.difficulty, this.question, this.correctAnswer});

  Question.fromMap(Map<String, dynamic> data)
      : categoryName = data["category"],
        difficulty = data["difficulty"] == "easy"
            ? Difficulty.easy
            : data["difficulty"] == "medium"
                ? Difficulty.medium
                : Difficulty.hard,
        question = data["question"],
        correctAnswer = data["correct_answer"];

  static List<Question> fromData(List<Map<String, dynamic>> data) {
    return data.map((question) => Question.fromMap(question)).toList();
  }
}
