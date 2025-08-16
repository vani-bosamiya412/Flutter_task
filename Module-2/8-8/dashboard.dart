import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  bool dialogShown = false;

  final List<String> productName = ["Pen", "Pencil", "Eraser", "Sharpener", "Scale (Ruler)", "Marker", "Highlighter", "Notebook", "Sticky Notes",
    "Glue Stick", "Scissors", "Stapler", "Paper Clips", "File Folder", "Whiteboard Marker"];
  final List<String> productImage = [
    "assets/pen.jpg",
    "assets/pencil.jpg",
    "assets/eraser.jpg",
    "assets/sharpener.jpg",
    "assets/scale.jpg",
    "assets/marker.jpg",
    "assets/highlighter.jpg",
    "assets/notebook.jpg",
    "assets/stickyNotes.jpg",
    "assets/glueStick.jpg",
    "assets/scissor.jpg",
    "assets/stapler.jpg",
    "assets/paperClips.jpg",
    "assets/folder.jpg",
    "assets/whiteboardMarker.jpg",
  ];
  final List<String> productPrice = ["20", "50", "60", "140", "150", "200", "125", "300", "60", "270", "40", "60", "25", "60", "100"];
  late List<String> productQty;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    productQty = List.generate(productName.length, (index) => "1");
    Future.delayed(Duration.zero, () {
      showWelcomeDialog();
    });
  }

  void _incrementQty(int index) {
    setState(() {
      int currentQty = int.parse(productQty[index]);
      currentQty++;
      productQty[index] = currentQty.toString();
    });
  }

  void _decrementQty(int index) {
    setState(() {
      int currentQty = int.parse(productQty[index]);
      if (currentQty > 1) {
        currentQty--;
        productQty[index] = currentQty.toString();
      }
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home", style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Center(
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: (0.55),  // Adjust ratio to fit content
            ),
            itemCount: productName.length,
            itemBuilder: (context, index) {
              return Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: BorderSide(color: Colors.grey.shade300, width: 1),
                ),
                child: ListTile(
                  title: Text(productName[index],  textAlign: TextAlign.left, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                  subtitle: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(productImage[index]),
                            SizedBox(height: 8,),
                            Text("Rs. ${productPrice[index]}", style: TextStyle(fontSize: 18),),
                            SizedBox(height: 4,),
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.blue,
                                  foregroundColor: Colors.white
                                ),
                                onPressed: () {},
                                child: Text("SUBSCRIBE @ ${productPrice[index]}", style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),)
                              ),
                            ),
                            SizedBox(height: 8,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Row(
                                    children: [
                                      InkWell(
                                        onTap: () => _decrementQty(index),
                                        child: const Padding(
                                          padding: EdgeInsets.all(4.0),
                                          child: Icon(Icons.remove, size: 18),
                                        )
                                      ),
                                      SizedBox(width: 5,),
                                      Text(productQty[index], style: TextStyle(fontSize: 16),),
                                      SizedBox(width: 5,),
                                      InkWell(
                                        onTap: () => _incrementQty(index),
                                        child: const Padding(
                                          padding: EdgeInsets.all(4.0),
                                          child: Icon(Icons.add, size: 18),
                                        )
                                      ),
                                    ],
                                  ),
                                ),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    side: BorderSide(color: Colors.blue),
                                    padding: EdgeInsets.symmetric(horizontal: 14),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5)
                                    )
                                  ),
                                  onPressed: () {},
                                  child: Text("Add")
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }
          )
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue
              ),
              accountName: Text("Vani"),
              accountEmail: Text("vani@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Text("V", style: TextStyle(fontSize: 40),),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("Home"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text("My Profile"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.shopping_cart),
              title: Text("My Cart"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.contact_support),
              title: Text("Contact Us"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text("Logout"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  void showWelcomeDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(15)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  )
                ),
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Welcome", style: TextStyle(fontSize: 18), textAlign: TextAlign.center,),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(Icons.close, color: Colors.white,),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(15),
                child: Text("Welcome To The Stationery Store App!", style: TextStyle(fontSize: 18), textAlign: TextAlign.center,),
              ),
            ],
          ),
        );
      }
    );
  }
}