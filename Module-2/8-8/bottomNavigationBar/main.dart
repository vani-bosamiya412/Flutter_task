import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MaterialApp(home: IconsApp(), debugShowCheckedModeBanner: false,));
}

class IconsApp extends StatefulWidget {
  const IconsApp({super.key});

  @override
  State<IconsApp> createState() => _IconsAppState();
}

class _IconsAppState extends State<IconsApp> {
  final String phoneNumber = "tel: +91 9157715024";

  final Uri smsUri = Uri.parse('sms:+91 9157715024?body=Hello!');

  late int _selectedIndex = 0;

  _makeCall() async {
    if (!await launchUrl(Uri.parse(phoneNumber))) {
      throw 'Could not launch $phoneNumber';
    }
  }

  _makeSms() async {
    if (!await launchUrl(smsUri)) {
      throw 'Could not launch $phoneNumber';
    }
  }

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
        title: Text("Icons"),
        centerTitle: true,
        backgroundColor: Colors.pink.shade50,
        actions: [
          IconButton(onPressed: _makeCall, icon: Icon(Icons.call)),
          IconButton(onPressed: _makeSms, icon: Icon(Icons.sms)),
          IconButton(onPressed: (){}, icon: Icon(Icons.email)),
        ],
      ),
      body: Column(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(18.0),
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
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home"
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "Search"
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile"
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        iconSize: 30,
        onTap: _onItemTapped,
      ),
    );
  }

  _onItemTapped(int value) {
    setState(() {
      _selectedIndex = value;
    });
  }
}
