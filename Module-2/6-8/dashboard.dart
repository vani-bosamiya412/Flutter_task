import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

enum Payment {cash, online}

class _DashboardScreenState extends State<DashboardScreen> {
  final String phoneNumber = "tel: 9157715024";
  TextEditingController tableNo = TextEditingController();
  Payment pay = Payment.cash;

  bool pizza = false;
  bool burger = false;
  bool coffee = false;
  bool sandwich = false;
  bool pasta = false;
  bool fries = false;
  bool momo = false;
  bool iceCream = false;
  bool cake = false;
  bool coldDrink = false;

  late int total;
  late String bill;

  _makeCall() async {
    if (!await launchUrl(Uri.parse(phoneNumber))) {
      throw 'Could not launch $phoneNumber';
    }
  }

  generateBill() {
    if(tableNo.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Please enter table number")));
      return;
    }

    if(!(pizza || burger || coffee || sandwich || pasta || fries || momo || iceCream || cake || coldDrink)) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Please select at least one item")));
      return;
    }

    total = 0;
    bill = "";

    if(pizza == true) {
      bill += "Pizza - Rs. 200\n";
      total += 200;
    }
    if(burger == true) {
      bill += "Burger - Rs. 150\n";
      total += 150;
    }
    if(coffee == true) {
      bill += "Coffee - Rs. 120\n";
      total += 120;
    }
    if(sandwich == true) {
      bill += "Sandwich - Rs. 160\n";
      total += 160;
    }
    if(pasta == true) {
      bill += "Pasta - Rs. 140\n";
      total += 140;
    }
    if(fries == true) {
      bill += "Fries - Rs. 100\n";
      total += 100;
    }
    if(momo == true) {
      bill += "Momo - Rs. 70\n";
      total += 70;
    }
    if(iceCream == true) {
      bill += "Ice Cream - Rs. 80\n";
      total += 80;
    }
    if(cake == true) {
      bill += "Cake - Rs. 300\n";
      total += 300;
    }
    if(coldDrink == true) {
      bill += "Cold Drink - Rs. 25\n";
      total += 25;
    }

    String paymentMethod = (pay == Payment.cash) ? "Cash" : "Online";
    
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Bill"),
          content: Text("Table Number: ${tableNo.text}\n\n$bill\nTotal: Rs. $total\n\nPayment Method: $paymentMethod", style: TextStyle(fontSize: 18),),
          actions: [
            TextButton(onPressed: () => Navigator.pop(context), child: Text("OK"))
          ],
        );
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome Admin", style: TextStyle(fontSize: 25, color: Colors.white),),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
        actions: [
          IconButton(onPressed: _makeCall, icon: Icon(Icons.call, color: Colors.white,))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text("MENU", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
              ),
              SizedBox(height: 15,),
              TextFormField(
                controller: tableNo,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Enter Table Number",
                  border: OutlineInputBorder()
                ),
              ),
              SizedBox(height: 15),
              CheckboxListTile(
                secondary: Image.asset("assets/pizza.jpg"),
                title: Text("Pizza", style: TextStyle(fontSize: 18),),
                subtitle: Text("Rs. 200", style: TextStyle(fontSize: 15)),
                value: pizza,
                onChanged: (value) {
                  setState(() {
                    pizza = value!;
                  });
                }
              ),
              SizedBox(height: 10,),
              CheckboxListTile(
                secondary: Image.asset("assets/burger.jpeg"),
                title: Text("Burger", style: TextStyle(fontSize: 18),),
                subtitle: Text("Rs. 150", style: TextStyle(fontSize: 15)),
                value: burger,
                onChanged: (value) {
                  setState(() {
                    burger = value!;
                  });
                }
              ),
              SizedBox(height: 10,),
              CheckboxListTile(
                secondary: Image.asset("assets/coffee.jpg"),
                title: Text("Coffee", style: TextStyle(fontSize: 18),),
                subtitle: Text("Rs. 120", style: TextStyle(fontSize: 15)),
                value: coffee,
                onChanged: (value) {
                  setState(() {
                    coffee = value!;
                  });
                }
              ),
              SizedBox(height: 10,),
              CheckboxListTile(
                secondary: Image.asset("assets/sandwich.jpg"),
                title: Text("Sandwich", style: TextStyle(fontSize: 18),),
                subtitle: Text("Rs. 160", style: TextStyle(fontSize: 15)),
                value: sandwich,
                onChanged: (value) {
                  setState(() {
                    sandwich = value!;
                  });
                }
              ),
              SizedBox(height: 10,),
              CheckboxListTile(
                secondary: Image.asset("assets/pasta.jpg"),
                title: Text("Pasta", style: TextStyle(fontSize: 18),),
                subtitle: Text("Rs. 140", style: TextStyle(fontSize: 15)),
                value: pasta,
                onChanged: (value) {
                  setState(() {
                    pasta = value!;
                  });
                }
              ),
              SizedBox(height: 10,),
              CheckboxListTile(
                secondary: Image.asset("assets/fries.jpg"),
                title: Text("Fries", style: TextStyle(fontSize: 18),),
                subtitle: Text("Rs. 100", style: TextStyle(fontSize: 15)),
                value: fries,
                onChanged: (value) {
                  setState(() {
                    fries = value!;
                  });
                }
              ),
              SizedBox(height: 10,),
              CheckboxListTile(
                secondary: Image.asset("assets/momo.jpg"),
                title: Text("Momo", style: TextStyle(fontSize: 18),),
                subtitle: Text("Rs. 70", style: TextStyle(fontSize: 15)),
                value: momo,
                onChanged: (value) {
                  setState(() {
                    momo = value!;
                  });
                }
              ),
              SizedBox(height: 10,),
              CheckboxListTile(
                secondary: Image.asset("assets/cake.jpg"),
                title: Text("Cake", style: TextStyle(fontSize: 18),),
                subtitle: Text("Rs. 300", style: TextStyle(fontSize: 15)),
                value: cake,
                onChanged: (value) {
                  setState(() {
                    cake = value!;
                  });
                }
              ),
              SizedBox(height: 10,),
              CheckboxListTile(
                secondary: Image.asset("assets/coldDrink.jpg"),
                title: Text("Cold Drink", style: TextStyle(fontSize: 18),),
                subtitle: Text("Rs. 25", style: TextStyle(fontSize: 15)),
                value: coldDrink,
                onChanged: (value) {
                  setState(() {
                    coldDrink = value!;
                  });
                }
              ),
              SizedBox(height: 15,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Radio<Payment>(
                          value: Payment.cash,
                          groupValue: pay,
                          onChanged: (value) {
                            setState(() {
                              pay = value!;
                            });
                          }
                      ),
                      Text("Cash", style: TextStyle(fontSize: 16)),
                    ],
                  ),
                  SizedBox(width: 20,),
                  Row(
                    children: [
                      Radio<Payment>(
                          value: Payment.online,
                          groupValue: pay,
                          onChanged: (value) {
                            setState(() {
                              pay = value!;
                            });
                          }
                      ),
                      Text("Online", style: TextStyle(fontSize: 16)),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 10,),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      generateBill();
                    });
                  },
                  child: Text("Generate Bill", style: TextStyle(fontSize: 18),)
                ),
              ),
              SizedBox(height: 15,),
            ],
          ),
        ),
      ),
    );
  }
}