import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(MaterialApp(home: CalculatorPage(), debugShowCheckedModeBanner: false,));
}

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({super.key});

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {

  TextEditingController num1 = TextEditingController();
  TextEditingController num2 = TextEditingController();
  String? selectedOperation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculator"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            TextField(
              controller: num1,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: "Enter First Number"
              ),
            ),
            SizedBox(height: 15,),
            TextField(
              controller: num2,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  hintText: "Enter Second Number"
              ),
            ),
            SizedBox(height: 15,),
            Column(
              children: [
                RadioListTile(
                  value: "Addition",
                  title: Text("Addition", style: TextStyle(fontSize: 20),),
                  groupValue: selectedOperation,
                  onChanged: (value) {
                    setState(() {
                      selectedOperation = value!;
                    });
                    calculate(value);
                  }
                ),
                RadioListTile(
                  value: "Subtraction",
                  title: Text("Subtraction", style: TextStyle(fontSize: 20),),
                  groupValue: selectedOperation,
                  onChanged: (value) {
                    setState(() {
                      selectedOperation = value!;
                    });
                    calculate(value);
                  }
                ),
                RadioListTile(
                  value: "Multiplication",
                  title: Text("Multiplication", style: TextStyle(fontSize: 20),),
                  groupValue: selectedOperation,
                  onChanged: (value) {
                    setState(() {
                      selectedOperation = value!;
                    });
                    calculate(value);
                  }
                ),
                RadioListTile(
                  value: "Division",
                  title: Text("Division", style: TextStyle(fontSize: 20),),
                  groupValue: selectedOperation,
                  onChanged: (value) {
                    setState(() {
                      selectedOperation = value!;
                    });
                    calculate(value);
                  }
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  calculate(String? operation) {
    double n1 = double.tryParse(num1.text) ?? 0;
    double n2 = double.tryParse(num2.text) ?? 0;
    double result = 0;

    switch(operation) {
      case "Addition": result = n1 + n2;
      case "Subtraction": result = n1 - n2;
      case "Multiplication": result = n1 * n2;
      case "Division":
        if(n2 != 0) {
          result = n1 / n2;
        } else {
          Fluttertoast.showToast(msg: "Cannot divide by zero!");
          return;
        }
    }
    
    Fluttertoast.showToast(
      msg: "Result: $result",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM
    );
  }
}
