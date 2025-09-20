import 'package:flutter/material.dart';

class MyModel extends StatelessWidget {
  final List list;
  const MyModel({super.key, required this.list});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (context, index) {
        var item = list[index];
        return Card(
          elevation: 4,
          margin: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    item['imageurl'],
                    height: 200,
                    width: double.infinity,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  item['name'],
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Real Name: ${item['realname']}",
                  style: TextStyle(fontSize: 16),
                ),
                Text("Team: ${item['team']}"),
                Text("First Appearance: ${item['firstappearance']}"),
                Text("Created By: ${item['createdby']}"),
                Text("Publisher: ${item['publisher']}"),
                SizedBox(height: 8),
                Text(item['bio'].toString(),),
              ],
            ),
          ),
        );
      }
    );
  }
}
