import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LikeCount extends StatefulWidget {
  @override
  LikeCountState createState() => LikeCountState();
}

class LikeCountState extends State {
  int like = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(height: 15,),
          Text("Likes: $like", style: TextStyle(fontSize: 20),),
          SizedBox(height: 15,),
          ElevatedButton(onPressed: () {
            setState(() {
              like++;
            });
          }, child: Text("Like", style: TextStyle(fontSize: 20),))
        ],
      ),
    );
  }
}
