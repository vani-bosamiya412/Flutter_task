import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MaterialApp(home: IconsApp(), debugShowCheckedModeBanner: false,));
}

class IconsApp extends StatelessWidget {
  final String phoneNumber = "tel: +91 9157715024";
  final Uri smsUri = Uri.parse('sms:+91 9157715024?body=Hello!');

  _makeCall() async {
    if (!await launchUrl(Uri.parse(phoneNumber))) {
      throw 'Could not launch $phoneNumber';
    }
  }

  _makeSms() async {
    if (!await launchUrl(smsUri)) {
      throw 'Could not launch $phoneNumber';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Icons"),
        centerTitle: true,
        backgroundColor: Colors.pink.shade50,
        actions: [
          IconButton(onPressed: _makeCall, icon: Icon(Icons.call)),
          IconButton(onPressed: _makeSms, icon: Icon(Icons.sms)),
          IconButton(onPressed: (){}, icon: Icon(Icons.email)),
        ],
      ),
    );
  }
}
