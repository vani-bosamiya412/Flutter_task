import 'package:flutter/material.dart';
import 'package:profile/footer.dart';
import 'package:profile/like_count.dart';
import 'package:profile/mood.dart';
import 'package:profile/profile.dart';

class CommonScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile App"),
        backgroundColor: Colors.blue.shade100,
      ),
      body: Center(
        child: Column(
          children: [
            profile(),
            LikeCount(),
            MoodScreen(),
            Footer()
          ],
        ),
      ),
    );
  }
}
