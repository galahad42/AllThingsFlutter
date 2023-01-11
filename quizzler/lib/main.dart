import 'package:flutter/material.dart';
import 'quiz_brain.dart';

QuizBrain quizBrain = QuizBrain();

void main() {
  runApp(const Quizzler());
}

class Quizzler extends StatelessWidget {
  const Quizzler({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: const SafeArea(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: QuizPage(),
        ),
      ),
    ));
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Widget> iconTypes = [
    const Icon(
      Icons.check,
      color: Colors.green,
    ),
    const Icon(
      Icons.close,
      color: Colors.red,
    )
  ];

  List<Widget> scoreKeeper = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                quizBrain.displayQuestion(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            color: Colors.green,
            child: TextButton(
              onPressed: () {
                setState(() {
                  if (quizBrain.checkAnswer() == true) {
                    scoreKeeper.add(iconTypes[0]);
                  } else {
                    scoreKeeper.add(iconTypes[1]);
                  }
                  quizBrain.getNextQuestion();
                });
              },
              child: const Text(
                'True',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            color: Colors.red,
            child: TextButton(
              onPressed: () {
                setState(() {
                  if (quizBrain.checkAnswer() == false) {
                    scoreKeeper.add(iconTypes[0]);
                  } else {
                    scoreKeeper.add(iconTypes[1]);
                  }
                  quizBrain.getNextQuestion();
                });
              },
              child: const Text(
                'False',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
        Row(
          children: scoreKeeper,
        )
      ],
    );
  }
}
