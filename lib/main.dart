import 'package:flutter/material.dart';

import 'screen/game_page.dart';

void main() {
  runApp(const RockPaperScissorsGame());
}

class RockPaperScissorsGame extends StatelessWidget {
  const RockPaperScissorsGame({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Rock, Paper, Scissors',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const RockPaperScissorsPage(),
    );
  }
}
