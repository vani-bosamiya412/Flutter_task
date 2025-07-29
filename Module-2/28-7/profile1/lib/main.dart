import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Common(),
      debugShowCheckedModeBanner: false
    );
  }
}

class Common extends StatelessWidget {
  const Common({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile App"),
        backgroundColor: Colors.blue.shade100,
      ),
      body: Center(
        child: Column(
          children: [
            Profile(),
            LikeCount(),
            MoodScreen(),
            Footer()
          ],
        ),
      ),
    );
  }
}

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(30),
      child: Row(
        children: [
          CircleAvatar(
            radius: 60,
            backgroundImage: AssetImage("assets/1.jpg"),
          ),
          SizedBox(width: 35,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Vani Bosamiya", style: TextStyle(fontSize: 20),),
              Text("Flutter Learner", style: TextStyle(fontSize: 18, color: Colors.grey),)
            ],
          )
        ],
      ),
    );
  }
}

class LikeCount extends StatefulWidget {
  const LikeCount({super.key});

  @override
  LikeCountState createState() => LikeCountState();
}

class LikeCountState extends State {
  int like = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 15,),
        Text("Likes: $like", style: TextStyle(fontSize: 20),),
        SizedBox(height: 15,),
        ElevatedButton(onPressed: () {
          setState(() {
            like++;
          });
        }, child: Text("Like", style: TextStyle(fontSize: 20),))
      ],
    );
  }
}

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
        Text(isHappy ? "😄 Happy" : "😔 Sad", style: TextStyle(fontSize: 18),),
        SizedBox(height: 15,),
        TextButton(onPressed: () {
          toggleMood();
        }, child: Text("Change Mood")),
      ],
    );
  }

  toggleMood() {
    setState(() {
      isHappy = !isHappy;
    });
  }
}

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          children: [
            SizedBox(height: 50,),
            Text("Vani Bosamyia", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Text("Powered By Flutter", style: TextStyle(fontSize: 20, color: Colors.grey.shade700),)
          ],
        )
    );
  }
}