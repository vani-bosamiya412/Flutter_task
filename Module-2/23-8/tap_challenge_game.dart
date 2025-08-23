import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'main.dart';

class TapChallengeGame extends StatefulWidget {
  const TapChallengeGame({super.key});

  @override
  State<TapChallengeGame> createState() => _TapChallengeGameState();
}

class _TapChallengeGameState extends State<TapChallengeGame> {
  late SharedPreferences sharedPreferences;
  int score = 0;
  int timeLeft = 10;
  bool gameStarted = false;
  Timer? time;

  startGame() {
    if(gameStarted) return;
    gameStarted = true;
    score = 0;
    timeLeft = 10;

    time = Timer.periodic(Duration(seconds: 1), (t) {
      setState(() {
        if(timeLeft > 0) {
          timeLeft--;
        } else {
          time!.cancel();
          gameStarted = false;
        }
      });
    });
  }

  tapButton() {
    if(!gameStarted) {
      startGame();
    }
    if(timeLeft > 0) {
      setState(() {
        score++;
      });
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    time!.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tap Challenge", style: TextStyle(fontSize: 20, color: Colors.white),),
        backgroundColor: Colors.blueGrey,
        actions: [
          IconButton(
            onPressed: () {
              sharedPreferences.setBool("login", true);
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen()));
            },
            icon: Icon(Icons.logout, color: Colors.white,)
          )
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Time Left: $timeLeft", style: TextStyle(fontSize: 18),),
              SizedBox(height: 15,),
              Text("Score: $score", style:  TextStyle(fontSize: 18),),
              SizedBox(height: 15,),
              if(!gameStarted)
                ElevatedButton(
                    onPressed: startGame,
                    child: Text("Start Game", style: TextStyle(fontSize: 18),)
                ),
              if(gameStarted)
                ElevatedButton(
                  onPressed: tapButton, 
                  child: Text("Tap", style: TextStyle(fontSize: 18),)
                ),
            ],
          ),
        ),
      ),
    );
  }
}
