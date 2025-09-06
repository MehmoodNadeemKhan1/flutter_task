import 'package:flutter/material.dart';

class Showproducts extends StatefulWidget {
  const Showproducts({super.key});

  @override
  State<Showproducts> createState() => _ShowproductsState();
}

class _ShowproductsState extends State<Showproducts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 30.27,
        titleSpacing: 12,
        title: Text("Show Product List"),
      ),
      body: SingleChildScrollView(
           child: Column(
             children: [
               Row(
                 children: [
                   Container(

                   )
                 ],
               )
             ],
           ),
      )
    );
  }
}
