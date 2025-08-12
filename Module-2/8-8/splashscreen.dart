import 'package:flutter/material.dart';
import 'package:stationery/dashboard.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  TextEditingController city = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/Stationery.png", width: 300, height: 250,),
            SizedBox(height: 20,),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text("Select City"),
                      content: TextField(
                        controller: city,
                        decoration: InputDecoration(
                          labelText: "Enter City",
                          border: OutlineInputBorder(),
                        ),
                      ),
                      actions: [
                        ElevatedButton(
                          onPressed: () {
                            String city1 = city.text;
                            if(city1.isNotEmpty) {
                              Navigator.pop(context);
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Dashboard()));
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            foregroundColor: Colors.white,
                            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 35),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)
                            )
                          ),
                          child: Text("Save", style: TextStyle(fontSize: 20),),
                        )
                      ],
                    );
                  }
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 60),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)
                )
              ),
              child: Text("Proceed Shopping", style: TextStyle(fontSize: 25))
            ),
          ],
        )
      ),
    );
  }
}