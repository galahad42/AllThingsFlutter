import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(
      const MaterialApp(
        home: BallPage(),
      ),
    );

class BallPage extends StatelessWidget {
  const BallPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: const Text('Ask Me Anything'),
        backgroundColor: Colors.blue.shade900,
        centerTitle: true,
      ),
      body: const Ball(),
    );
  }
}

class Ball extends StatefulWidget {
  const Ball({super.key});

  @override
  State<Ball> createState() => _BallState();
}

class _BallState extends State<Ball> {
  int ballNumber = 1;

  void randomBallPicker() {
    setState(() {
    ballNumber = Random().nextInt(5) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        onPressed: () {
          randomBallPicker();
        },
        child: Image.asset('images/ball$ballNumber.png'),
      ),
    );
  }
}
