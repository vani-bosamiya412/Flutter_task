import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: BackgroundColorChange(), debugShowCheckedModeBanner: false,));
}

class BackgroundColorChange extends StatefulWidget {
  const BackgroundColorChange({super.key});

  @override
  State<BackgroundColorChange> createState() => _BackgroundColorChangeState();
}

class _BackgroundColorChangeState extends State<BackgroundColorChange> {
  String? selectedColor;
  @override
  Widget build(BuildContext context) {
    Color backgroundColors;

    switch(selectedColor) {
      case "Red": backgroundColors = Colors.red.shade200;
      case "Green": backgroundColors = Colors.green.shade200;
      case "Blue": backgroundColors = Colors.blue.shade200;
      case "Purple": backgroundColors = Colors.purple.shade200;
      default: backgroundColors = Colors.white;
    }

    return Scaffold(
      backgroundColor: backgroundColors,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RadioListTile(
              value: "Red",
              title: Text("Red", style: TextStyle(fontSize: 20),),
              groupValue: selectedColor,
              onChanged: (value) {
                setState(() {
                  selectedColor = value;
                });
              }
            ),
            SizedBox(height: 15,),
            RadioListTile(
              value: "Green",
              title: Text("Green", style: TextStyle(fontSize: 20),),
              groupValue: selectedColor,
              onChanged: (value) {
                setState(() {
                  selectedColor = value;
                });
              }
            ),
            SizedBox(height: 15,),
            RadioListTile(
              value: "Blue",
              title: Text("Blue", style: TextStyle(fontSize: 20),),
              groupValue: selectedColor,
              onChanged: (value) {
                setState(() {
                  selectedColor = value;
                });
              }
            ),
            SizedBox(height: 15,),
            RadioListTile(
              value: "Purple",
              title: Text("Purple", style: TextStyle(fontSize: 20),),
              groupValue: selectedColor,
              onChanged: (value) {
                setState(() {
                  selectedColor = value;
                });
              }
            ),
            SizedBox(height: 15,),
          ],
        ),
      ),
    );
  }
}
