import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {

  final int value1;
  final int value2;
  const ResultPage({super.key, required this.value1, required this.value2});

  @override
  Widget build(BuildContext context) {
    List<int> numbers = [];
    for (int i = value1 + 1; i < value2; i++) {
      numbers.add(i);
    }
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: numbers.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(numbers[index].toString()),
                  );
                },
              )
            )
          ],
        ),
      ),
    );
  }
}
