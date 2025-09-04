import 'package:flutter/material.dart';

class Createlist extends StatefulWidget {
  const Createlist({super.key});

  @override
  State<Createlist> createState() => _CreatelistState();
}

class _CreatelistState extends State<Createlist> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 30.27,
        titleSpacing: 12,
        title: Text("Create List"),
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: ListView(
          children: [

            TextFormField(
              decoration: InputDecoration(
                labelText: "Name",
                prefixIcon: Icon(Icons.verified_user_outlined)
              ),
            ),
            TextFormField(
              decoration: InputDecoration(
                  labelText: "Name",
                  prefixIcon: Icon(Icons.verified_user_outlined)
              ),
            ),
            TextFormField(
              decoration: InputDecoration(
                  labelText: "Name",
                  prefixIcon: Icon(Icons.verified_user_outlined)
              ),
            ),

          ],
        ),
      ) ,
    );
  }
}
