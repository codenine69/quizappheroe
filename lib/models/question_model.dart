
// class QuestionModel {
//   String question;
//   final bool asnwer;

//   QuestionModel({required this.question, required this.asnwer});
// }

class QuestionModel {
  String imageUrl; 
  List<String> options; 
  String correctAnswer; 

  QuestionModel({
    required this.imageUrl,
    required this.options,
    required this.correctAnswer,
  });
}