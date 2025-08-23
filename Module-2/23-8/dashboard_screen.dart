import 'package:flutter/material.dart';
import 'package:game_app/random_number_guess.dart';
import 'package:game_app/tap_challenge_game.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int selectedIndex = 0;

  List<Widget> screens = [RandomNumberGuess(), TapChallengeGame()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon:Icon(Icons.numbers),
            label: "Guess"
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.touch_app),
            label: "Tap"
          )
        ],
        currentIndex: selectedIndex,
        selectedItemColor: Colors.black,
        iconSize: 30,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
      ),
    );
  }
}
