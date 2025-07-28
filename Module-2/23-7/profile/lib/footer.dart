import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SizedBox(height: 50,),
          Text("Vani Bosamyia", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          Text("Powered By Flutter", style: TextStyle(fontSize: 20, color: Colors.grey.shade700),)
        ],
      )
    );
  }
}
