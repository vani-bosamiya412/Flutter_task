import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: DoubleTapToExitExample(), debugShowCheckedModeBanner: false,));
}

class DoubleTapToExitExample extends StatefulWidget {
  const DoubleTapToExitExample({super.key});

  @override
  State<DoubleTapToExitExample> createState() => _DoubleTapToExitState();
}

class _DoubleTapToExitState extends State<DoubleTapToExitExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Double Tap To Exit"),
        backgroundColor: Colors.redAccent.shade100,
      ),
      body: DoubleBackToCloseApp(
        snackBar: SnackBar(content: Text("Tap again to exit!")),
        child: Center(child: Text('Just an example', style: TextStyle(fontSize: 20),))
      )
    );
  }
}
