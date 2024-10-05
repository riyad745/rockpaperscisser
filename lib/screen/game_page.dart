import 'dart:math';

import 'package:flutter/material.dart';

class RockPaperScissorsPage extends StatefulWidget {
  const RockPaperScissorsPage({super.key});

  @override
  State<RockPaperScissorsPage> createState() => _RockPaperScissorsPageState();
}

class _RockPaperScissorsPageState extends State<RockPaperScissorsPage> {
  final _random = Random();
  String? _playerChoice;
  String? _computerChoice;
  String? _result;
  int _playerScore = 0;
  int _computerScore = 0;

  void _playGame(String playerChoice) {
    setState(() {
      _playerChoice = playerChoice;
      _computerChoice = _getComputerChoice();
      _result = _calculateResult();
    });
  }

  String _getComputerChoice() {
    List<String> choices = ['🪨', '📄', '✂️'];
    return choices[_random.nextInt(choices.length)];
  }

  String _calculateResult() {
    if (_playerChoice == _computerChoice) {
      return 'It\'s a tie!';
    } else if ((_playerChoice == '🪨' && _computerChoice == '✂️') ||
        (_playerChoice == '📄' && _computerChoice == '🪨') ||
        (_playerChoice == '✂️' && _computerChoice == '📄')) {
      _playerScore++;
      if (_playerScore == 5) {
        _resetGame('Player');
        return 'Player wins!';
      }
      return 'You win!';
    } else {
      _computerScore++;
      if (_computerScore == 5) {
        _resetGame('Computer');
        return 'Computer wins!';
      }
      return 'Computer wins!';
    }
  }

  void _resetGame(String winner) {
    _playerScore = 0;
    _computerScore = 0;
    _result = null;
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('$winner Wins!'),
          content: const Text('Do you want to play again?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('No'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                setState(() {});
              },
              child: const Text('Yes'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: const Text('Rock, Paper, Scissors'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  'Player: $_playerScore',
                  style: const TextStyle(fontSize: 20),
                ),
                const Spacer(),
                Text(
                  'Computer: $_computerScore',
                  style: const TextStyle(fontSize: 20),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              'Choose your move:',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () => _playGame('🪨'),
                  child: const Text('🪨'),
                ),
                ElevatedButton(
                  onPressed: () => _playGame('📄'),
                  child: const Text('📄'),
                ),
                ElevatedButton(
                  onPressed: () => _playGame('✂️'),
                  child: const Text('✂️'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            if (_result != null)
              Text(
                'You chose $_playerChoice, computer chose $_computerChoice.\n$_result',
                style: const TextStyle(fontSize: 20),
                textAlign: TextAlign.center,
              ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              'To win you have to score 5 points',
              style: TextStyle(fontSize: 20, color: Colors.blueAccent),
            )
          ],
        ),
      ),
    );
  }
}
