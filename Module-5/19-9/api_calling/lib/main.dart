import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'model.dart';

void main() {
  runApp(MaterialApp(home: MyApp(), debugShowCheckedModeBanner: false,));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  
  getData() async {
    var url = Uri.parse("https://simplifiedcoding.net/demos/marvel/");
    var resp = await http.get(url);
    return jsonDecode(resp.body);
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("API Calling"),),
      body: FutureBuilder(
        future: getData(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if(snapshot.hasError) {
            return Center(child: Text("Error loading data"));
          }
          if(snapshot.hasData) {
            return MyModel(list:snapshot.data);
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
