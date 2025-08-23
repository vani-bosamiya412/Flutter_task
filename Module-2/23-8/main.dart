import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'dashboard_screen.dart';

void main() {
  runApp(MaterialApp(home: LoginScreen(), debugShowCheckedModeBanner: false,));
}

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
  late SharedPreferences sharedPreferences;
  late bool newUser;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkLogin();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Login", style: TextStyle(fontSize: 20, color: Colors.white),),
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

                      sharedPreferences.setBool("login", false);
                      sharedPreferences.setString("myEmail", email);
                      sharedPreferences.setString("myPass", password);

                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => DashboardScreen()));
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

  checkLogin() async {
    sharedPreferences = await SharedPreferences.getInstance();

    newUser = (sharedPreferences.getBool("login") ?? true);
    if (!mounted) return;
    if(newUser == false) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => DashboardScreen()));
    }
  }
}