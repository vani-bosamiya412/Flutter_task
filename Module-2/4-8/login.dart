import 'package:flutter/material.dart';

import 'dashboard.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late String email, password;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _keyForm = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text("Login Form", style: TextStyle(fontSize: 25, color: Colors.white),),
            centerTitle: true,
            backgroundColor: Colors.blueGrey
        ),
        body: Form(
            key: _keyForm,
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                children: [
                  TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(labelText: "Email", border: OutlineInputBorder()),
                    validator: (value) {
                      if(value!.isEmpty) {
                        return "Please enter email!";
                      } else {
                        return null;
                      }
                    },
                  ),
                  SizedBox(height: 15),
                  TextFormField(
                    controller: passwordController,
                    decoration: InputDecoration(labelText: "Password", border: OutlineInputBorder()),
                    obscureText: true,
                    validator: (value) {
                      if(value!.isEmpty) {
                        return "Please enter password!";
                      } else {
                        return null;
                      }
                    },
                  ),
                  SizedBox(height: 15),
                  ElevatedButton(
                      onPressed: () {
                        if(_keyForm.currentState!.validate()){
                          email = emailController.text.toString();
                          password = passwordController.text.toString();

                          if(email == "admin@gmail.com" && password == "0412") {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Logged In Successfully!")));
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => DashboardScreen()));
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Invalid Credentials!")));
                          }
                        }
                      },
                      child: Text("Login")
                  )
                ],
              ),
            )
        )
    );
  }
}