import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'model.dart';

void main() {
  runApp(MaterialApp(home: HeroesNameImage(), debugShowCheckedModeBanner: false,));
}

class HeroesNameImage extends StatefulWidget {
  const HeroesNameImage({super.key});

  @override
  State<HeroesNameImage> createState() => _HeroesNameImageState();
}

class _HeroesNameImageState extends State<HeroesNameImage> {
  getData() async {
    var url = Uri.parse("https://www.simplifiedcoding.net/demos/view-flipper/heroes.php");
    var resp = await http.get(url);
    if (resp.statusCode == 200) {
      var decoded = jsonDecode(resp.body);
      return decoded["heroes"];
    } else {
      throw Exception("Failed to load data");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Heroes List"),),
      body: FutureBuilder(
        future: getData(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if(snapshot.hasError) {
            return Center(child: Text("Error loading the data."),);
          }
          if(snapshot.hasData) {
            return MyModel(list: snapshot.data);
          }
          return Center(child: CircularProgressIndicator(),);
        },
      ),
    );
  }
}