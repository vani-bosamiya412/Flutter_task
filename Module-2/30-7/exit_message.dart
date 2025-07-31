import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: ExitMessage(), debugShowCheckedModeBanner: false));
}

class ExitMessage extends StatelessWidget {
  const ExitMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        bool shouldExit = await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text("Exit"),
            content: Text("Are you sure you want to exit?", style: TextStyle(fontSize: 18),),
            actions: [
              TextButton(
                  child: Text("Yes", style: TextStyle(fontSize: 18)),
                  onPressed: () => Navigator.of(context).pop(true)
              ),
              TextButton(
                child: Text("No", style: TextStyle(fontSize: 18)),
                onPressed: () => Navigator.of(context).pop(false)
              )
            ],
          )
        );
        return shouldExit;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("Exit Confirmation", style: TextStyle(fontSize: 20),),
          backgroundColor: Colors.orange.shade50,
        ),
        body: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              Text("Press back button to test exit confirmation", style: TextStyle(fontSize: 18),)
            ],
          ),
        ),
      )
    );
  }
}