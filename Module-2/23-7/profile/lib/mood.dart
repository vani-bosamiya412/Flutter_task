import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MoodScreen extends StatefulWidget {
  const MoodScreen({super.key});

  @override
  MoodScreenState createState() => MoodScreenState();
}

class MoodScreenState extends State {
  bool isHappy = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 60,),
        Text("Current Mood: ", style: TextStyle(fontSize: 20),),
        SizedBox(height: 15),
        Text(isHappy ? "😄 Happy" : "😔 Sad"),
        SizedBox(height: 15,),
        TextButton(onPressed: () {
          togglemood();
        }, child: Text("Change Mood")),
      ],
    );
  }

  togglemood() {
    setState(() {
      isHappy = !isHappy;
    });
  }

}
