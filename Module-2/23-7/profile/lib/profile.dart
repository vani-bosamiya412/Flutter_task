import 'package:flutter/material.dart';

class profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(30),
      child: Row(
        children: [
          CircleAvatar(
            radius: 60,
            backgroundImage: AssetImage("assets/1.jpg"),
          ),
          SizedBox(width: 35,),
          Column(
            children: [
              Text("Name: Vani Bosamiya", style: TextStyle(fontSize: 20),),
              SizedBox(height: 10,),
              Text("Bio: Flutter Learner", style: TextStyle(fontSize: 20),)
            ],
          )
        ],
      ),
    );
  }
}
