import 'package:flutter/material.dart';

class DiceDisplayWidget extends StatelessWidget {
  final int leftDiceNumber;
  final int rightDiceNumber;

  const DiceDisplayWidget({
    super.key,
    required this.leftDiceNumber,
    required this.rightDiceNumber,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            transitionBuilder: (Widget child, Animation<double> animation) {
              return FadeTransition(opacity: animation, child: child);
            },
            child: Image.asset(
              'assets/images/dice$leftDiceNumber.png',
              key: ValueKey<int>(leftDiceNumber),
              width: 100,
              height: 100,
              semanticLabel: 'Dice showing $leftDiceNumber',
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            transitionBuilder: (Widget child, Animation<double> animation) {
              return FadeTransition(opacity: animation, child: child);
            },
            child: Image.asset(
              'assets/images/dice$rightDiceNumber.png',
              key: ValueKey<int>(rightDiceNumber),
              width: 100,
              height: 100,
              semanticLabel: 'Dice showing $rightDiceNumber',
            ),
          ),
        ),
      ],
    );
  }
}