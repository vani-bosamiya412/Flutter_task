import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

void main()
{
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TEXT TO SPEECH ',
      home: TexttoSpeechEx(),
    );
  }

}

class TexttoSpeechEx extends StatefulWidget {
  const TexttoSpeechEx({super.key});

  @override
  State<TexttoSpeechEx> createState() => _TexttoSpeechExState();
}

class _TexttoSpeechExState extends State<TexttoSpeechEx> {
  final FlutterTts tts = FlutterTts();
  final TextEditingController textController = TextEditingController();
  bool isSpeaking = false;

  @override
  void initState() {
    super.initState();
    tts.setCompletionHandler(() {
      setState(() => isSpeaking = false);
    });
  }

  @override
  void dispose() {
    tts.stop();
    textController.dispose();
    super.dispose();
  }

  Future<void> speak() async {
    if (textController.text.isEmpty) return;

    setState(() => isSpeaking = true);
    await tts.speak(textController.text);
  }

  Future<void> stop() async {
    await tts.stop();
    setState(() => isSpeaking = false);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Text To Speech App"),
        backgroundColor: Colors.blueGrey.shade200,
        elevation: 2,
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: textController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter Your Text'
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(onPressed: isSpeaking ? stop : speak,
                child: Text(isSpeaking ? 'Stop' : 'Speak'),
              )
            ],
          ),
        ),
      ),
    );
  }
}