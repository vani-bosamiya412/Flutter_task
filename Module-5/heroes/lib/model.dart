import 'package:flutter/material.dart';

class MyModel extends StatelessWidget {
  final List list;
  const MyModel({super.key, required this.list});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (context, value) {
        var item = list[value];
        return Card(
          elevation: 4,
          margin: EdgeInsets.symmetric(horizontal: 80, vertical: 8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    item['imageurl'],
                    width: 200,
                    height: 200,
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
                SizedBox(height: 10),
              ],
            ),
          ),
        );
      }
    );
  }
}
