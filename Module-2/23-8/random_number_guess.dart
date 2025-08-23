import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'main.dart';

class RandomNumberGuess extends StatefulWidget {
  const RandomNumberGuess({super.key});

  @override
  State<RandomNumberGuess> createState() => _RandomNumberGuessState();
}

class _RandomNumberGuessState extends State<RandomNumberGuess> {
  var data;
  late SharedPreferences sharedPreferences;
  int selectedIndex = 0;
  TextEditingController number = TextEditingController();
  late int random;
  int tries = 0;
  String message = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    generateRandomNumber();
  }

  generateRandomNumber() {
    random = Random().nextInt(50) + 1;
    tries = 0;
    message = "";
  }

  checkGuess() {
    if(number.text.isEmpty) return;
    int guess = int.parse(number.text);

    setState(() {
      tries++;
      if(guess == random) {
        message = "You are winner!";
      } else if(tries >= 5) {
        message = "You Lost! Number was $random";
      } else if (guess > random) {
        message = "Too High!";
      } else if(guess < random) {
        message = "Too Low!";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Random Number Game", style: TextStyle(fontSize: 20, color: Colors.white),),
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
            children: [
              Text("Guess the number between 1-50", style: TextStyle(fontSize: 18),),
              SizedBox(height: 15,),
              TextField(
                controller: number,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Enter Your Guess"
                ),
              ),
              SizedBox(height: 15,),
              ElevatedButton(
                  onPressed: checkGuess,
                  child: Text("Guess")
              ),
              SizedBox(height: 15,),
              Text(message, style: TextStyle(fontSize: 18),),
              SizedBox(height: 15,),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      generateRandomNumber();
                      number.clear();
                    });
                  },
                  child: Text("Play Again")
              )
            ],
          ),
        ),
      ),
    );
  }
}
