import 'package:flutter/material.dart';
import 'package:quizappg14/quizbrain.dart'; 

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Quizbrain quizbrain = Quizbrain();
 
  final List<Color> buttonColors = [
    Color(0xFF493A8B),  
    Color(0xFF4FC0A6),  
    Color(0xFFF9B838),  
    Color(0xFFE55260),  
  ];

  void checkAnswer(String userAnswer) {
    String correctAnswer = quizbrain.getCorrectAnswer();
    bool isCorrect = (userAnswer == correctAnswer);
 
    if (isCorrect) {
      quizbrain.correctScore++;
    } else {
      quizbrain.incorrectScore++;
    }
 
    quizbrain.nextQuestion();
 
    if (quizbrain.isFinishedFunc()) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.warning, color: Colors.orange),
                SizedBox(width: 8),
                Text("Juego Terminado"),
              ],
            ),
            content: Text(
              "Has llegado al final del formulario.\n\n"
              "Respuestas Correctas: ${quizbrain.getCorrectas()}\n"
              "Respuestas Incorrectas: ${quizbrain.getIncorrectas()}",
              textAlign: TextAlign.center,
            ),
            actions: [
              ElevatedButton(
                onPressed: () {
                  quizbrain.restartQuizz();
                  Navigator.pop(context); 
                  setState(() {});
                },
                child: Text("Jugar de Nuevo"),
              ),
            ],
          );
        },
      );
    } else {
      setState(() {});
    }
  }
 
  Widget botonOpcion(String optionText, Color color) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: MaterialButton(
        color: color,
        minWidth: double.infinity,
        height: double.infinity,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        onPressed: () {
          checkAnswer(optionText);
        },
        child: Text(
          optionText,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<String> currentOptions = quizbrain.getOptions();

    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff262626),
        appBar: AppBar(
          title: Text("Quiz de Superhéroes"),
          centerTitle: true,
          backgroundColor: Color(0xff262626),
          foregroundColor: Colors.white,
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              
              Text(
                "¿Cómo se llama el superhéroe?",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 16),
 
//  imagen
              Expanded(
                flex: 5,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: Image.network(
                    quizbrain.getImageUrl(),
                    fit: BoxFit.cover, 
                  ),
                ),
              ),
              SizedBox(height: 16),

             
              Expanded(
                flex: 4,
                child: GridView.count(
                  crossAxisCount: 2,
                  childAspectRatio: 1.8,  
                  children: [
                    botonOpcion(currentOptions[0], buttonColors[0]),
                    botonOpcion(currentOptions[1], buttonColors[1]),
                    botonOpcion(currentOptions[2], buttonColors[2]),
                    botonOpcion(currentOptions[3], buttonColors[3]),
                  ],
                ),
              ),

              
              SizedBox(
                height: 40,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
// correctas
                    Row(
                      children: [
                        Text(
                          "${quizbrain.getCorrectas()}",
                          style: TextStyle(
                            color: Colors.greenAccent,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(width: 8),
                        Icon(Icons.check, color: Colors.greenAccent, size: 28),
                      ],
                    ),
//  incorrectas               
                    Row(
                      children: [
                        Text(
                          "${quizbrain.getIncorrectas()}",
                          style: TextStyle(
                            color: Colors.redAccent,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(width: 8),
                        Icon(Icons.close, color: Colors.redAccent, size: 28),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}