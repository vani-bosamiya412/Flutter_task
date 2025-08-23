import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

void main() {
  runApp(MaterialApp(home: SpeechToTextApp(), debugShowCheckedModeBanner: false,));
}

class SpeechToTextApp extends StatefulWidget {
  const SpeechToTextApp({super.key});

  @override
  State<SpeechToTextApp> createState() => _SpeechToTextAppState();
}

class _SpeechToTextAppState extends State<SpeechToTextApp> {

  late stt.SpeechToText _speech;
  bool isListening = false;
  String text = "Press the mic and start speaking";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _speech = stt.SpeechToText();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Speech To Text"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: listen,
                icon: Icon(
                  isListening ? Icons.mic : Icons.mic_off,
                  size: 50,
                )
              ),
              SizedBox(height: 20,),
              Text(text, style: TextStyle(fontSize: 18),),
            ],
          ),
        ),
      ),
    );
  }

  listen() async {
    if(!isListening) {
      bool available = await _speech.initialize();

      if(available) {
        setState(() {
          isListening = true;
        });
        _speech.listen(onResult: (result) => setState(() {
          text = result.recognizedWords;
        }));
      }
    } else {
      setState(() {
        isListening = false;
        _speech.stop();
      });
    }
  }
}