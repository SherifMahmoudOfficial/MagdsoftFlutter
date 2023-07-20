class Help {
  final int id;
  final String question;
  final String answer;

  Help({required this.id, required this.question, required this.answer});

  factory Help.fromJson(Map<String, dynamic> json) {
    return Help(
      id: json['id'],
      question: json['question'],
      answer: json['answer'],
    );
  }
}