import 'package:flutter/material.dart';

class Showproducts extends StatelessWidget {
  const Showproducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 30.27,
        titleSpacing: 12,
        title: Text("Show Product List"),
      ),
      body: Center(
        child: Text("Hello I am the Product Show direct from the database"),
      ),
    );
  }
}
