import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MoodScreen extends StatefulWidget {
  const MoodScreen({super.key});

  @override
  MoodScreenState createState() => MoodScreenState();
}

class MoodScreenState extends State {
  String mood = "";
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 60,),
        Text("Current Mood: ${mood.isEmpty ? '' : mood}", style: TextStyle(fontSize: 20),),
        SizedBox(height: 15),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  mood = "Happy";
                });
              },
              child: Text("😄", style: TextStyle(fontSize: 30)),
            ),
            SizedBox(width: 20,),
            GestureDetector(
              onTap: () {
                setState(() {
                  mood = "Sad";
                });
              },
              child: Text("😔", style: TextStyle(fontSize: 30)),
            ),
          ],
        )
      ],
    );
  }
}