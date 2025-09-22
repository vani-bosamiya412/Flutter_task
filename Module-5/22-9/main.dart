import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'login.dart';

void main() {
  runApp(MaterialApp(home: HomeScreen()));
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController name = TextEditingController();
  TextEditingController surname = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Signup Form")),
      body: Form(
        key: _formKey,
        child: Center(
          child: Column(
            children: [
              TextFormField(
                controller: name,
                decoration: InputDecoration(hintText: "Enter Name"),
                validator: (value) {
                  if(value == null || value.isEmpty) {
                    return "Name is required";
                  } else if(!RegExp(r'^[a-zA-Z]+$').hasMatch(value)) {
                    return "Enter a valid name";
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: surname,
                decoration: InputDecoration(hintText: "Enter Surname"),
                validator: (value) {
                  if(value == null || value.isEmpty) {
                    return "Surname is required";
                  } else if(!RegExp(r'^[a-zA-Z]+$').hasMatch(value)) {
                    return "Enter a valid surname";
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: email,
                decoration: InputDecoration(hintText: "Enter Email"),
                validator: (value) {
                  if(value == null || value.isEmpty) {
                    return "Email is required";
                  } else if(!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
                    return "Enter a valid email";
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: password,
                obscureText: true,
                decoration: InputDecoration(hintText: "Enter Password"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Password is required";
                  } else if (!RegExp(r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$').hasMatch(value)) {
                    return "Password must be 8+ chars, include uppercase, lowercase, number & special char";
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  if(_formKey.currentState!.validate()) {
                    String n = name.text.toString();
                    String s = surname.text.toString();
                    String e = email.text.toString();
                    String p = password.text.toString();

                    signup(n, s, e, p);

                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                    );
                  }
                },
                child: Text("Signup"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  signup(var n, var s, var e, var p) {
    var url = Uri.parse("https://prakrutitech.xyz/API/insert.php");

    http.post(url, body: {"name": n, "surname": s, "email": e, "password": p});
  }
}