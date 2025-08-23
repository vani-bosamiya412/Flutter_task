import 'package:flutter/material.dart';

import 'result_page.dart';

void main() {
  runApp(MaterialApp(home: NumberBetween(), debugShowCheckedModeBanner: false,));
}

class NumberBetween extends StatelessWidget {

  final TextEditingController num1 = TextEditingController();
  final TextEditingController num2 = TextEditingController();

  NumberBetween({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: num1,
                decoration: InputDecoration(
                  hintText: "Enter Start Number"
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 15,),
              TextField(
                controller: num2,
                decoration: InputDecoration(
                  hintText: "Enter Enter Number"
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 15,),
              ElevatedButton(
                onPressed: () {
                  int a = int.tryParse(num1.text) ?? 0;
                  int b = int.tryParse(num2.text) ?? 0;
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ResultPage(value1: a, value2: b)));
                },
                child: Text("Okay", style: TextStyle(fontSize: 18),)
              )
            ],
          ),
        ),
      ),
    );
  }
}