import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: MyApp(), debugShowCheckedModeBanner: false,));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isMusicOn = false;
  late AudioPlayer audioPlayer;

  @override
  void initState() {
    super.initState();
    audioPlayer = AudioPlayer();
  }

  toggleMusic(bool value) async {
    setState(() {
      isMusicOn = value;
    });

    if(isMusicOn) {
      await audioPlayer.play(AssetSource("music.mp3"));
    } else {
      await audioPlayer.stop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Music Toggle Switch"),
        backgroundColor: Colors.blue.shade100
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.music_note,),
            SizedBox(width: 16,),
            Text("Music", style: TextStyle(fontSize: 20),),
            SizedBox(width: 35,),
            Switch(
              value: isMusicOn,
              onChanged: toggleMusic,
              activeTrackColor: Colors.blue.shade700,
              activeColor: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}
