import 'dart:math';
import 'package:flutter/material.dart';
import '../widgets/dice_display_widget.dart';
import '../widgets/roll_button_widget.dart';
import 'settings_page.dart';

class DicePage extends StatefulWidget {
  const DicePage({super.key});

  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDiceNumber = 1;
  int rightDiceNumber = 1;

  void rollDice() {
    setState(() {
      leftDiceNumber = Random().nextInt(6) + 1; // Generates 1 to 6
      rightDiceNumber = Random().nextInt(6) + 1;
    });
  }

  void navigateToSettings() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SettingsPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Dice Roller',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue[800],
        actions: [
          IconButton(
            icon: const Icon(Icons.settings, color: Colors.white),
            onPressed: navigateToSettings,
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.teal[50]!, Colors.teal[100]!],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DiceDisplayWidget(
                leftDiceNumber: leftDiceNumber,
                rightDiceNumber: rightDiceNumber,
              ),
              const SizedBox(height: 20),
              RollButtonWidget(onPressed: rollDice),
            ],
          ),
        ),
      ),
    );
  }
}