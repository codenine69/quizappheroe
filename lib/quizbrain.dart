import 'package:quizappg14/models/question_model.dart';

class Quizbrain {
  bool isFinished = false;
  int questionIndex = 0;
  int correctScore = 0;
  int incorrectScore = 0;

  List<QuestionModel> questionList = [
    QuestionModel(
      imageUrl: "https://cdn.hobbyconsolas.com/sites/navi.axelspringer.es/public/media/image/2014/11/406746-cine-superheroes-critica-capitan-america-primer-vengador.jpg",  
      options: [
        "El Americano",
        "Capitán Americano",
        "Capitán America",
        "Sr Capitán"
      ],
      correctAnswer: "Capitán America",
    ),
    QuestionModel(
      imageUrl: "https://wallpapers.com/images/hd/iron-man-pictures-k83lqhe6vnh95b1m.jpg", 
      options: ["Hombre de Hierro", "Iron Man", "Tony Stark", "El Metálico"],
      correctAnswer: "Iron Man",
    ),
    QuestionModel(
      imageUrl: "https://occ-0-8407-2219.1.nflxso.net/dnm/api/v6/6AYY37jfdO6hpXcMjf9Yu5cnmO0/AAAABZ1LbIUjr680cZQJZMXFIIbW7ZxjFYs2mSNoyeAp-YEbxyU3lkx8YsIa_1kv_3te1qvYmtvgGHnZzH-apGqEC4bilJq6o2iKJy0L.jpg", 
      options: ["La Masa", "El Verde", "Bruce Banner", "Hulk"],
      correctAnswer: "Hulk",
    ),
    QuestionModel(
      imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTQpg1SvaieYJ1JzBfW1NWiFErK1vFvoyeDYQ&s",  
      options: ["El Mago", "Loki", "Hermano de Thor", "El Vengador"],
      correctAnswer: "Loki",
    ),
    QuestionModel(
      imageUrl: "https://lumiere-a.akamaihd.net/v1/images/thor_hammer_c788ecfa.jpeg",  
      options: ["Thor", "Rey de Asgard", "Odin", "Hombre del Trueno"],
      correctAnswer: "Thor",
    ),
  ];

  
  String getImageUrl() {
    return questionList[questionIndex].imageUrl;
  }

  List<String> getOptions() {
    return questionList[questionIndex].options;
  }

  String getCorrectAnswer() {
    return questionList[questionIndex].correctAnswer;
  }
 
  void nextQuestion() {
    if (questionIndex < questionList.length - 1) {
      questionIndex++;
    } else {
      isFinished = true;
    }
  }

  bool isFinishedFunc() {
    return isFinished;
  }

  void restartQuizz() {
    questionIndex = 0;
    correctScore = 0;
    incorrectScore = 0;
    isFinished = false;
  }
 

//  puntaje
  int getCorrectas() => correctScore;
  int getIncorrectas() => incorrectScore;
}