import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext build) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Urbanist'),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final List<Map<String,String>> images = [
    {"image":"assets/images/image2.png", "name":"Shoes"},
    {"image":"assets/images/image3.png","name":"Shoes"},
    {"image":"assets/images/image4.png","name":"Shoes"},
    {"image":"assets/images/image5.png","name":"Shoes"},
    {"image":"assets/images/image6.png","name":"Shoes"},
    {"image":"assets/images/image2.png","name":"Shoes"},
    {"image":"assets/images/image3.png","name":"Shoes"},
    {"image":"assets/images/image4.png","name":"Shoes"},
    {"image":"assets/images/image5.png","name":"Shoes"},
    {"image":"assets/images/image6.png","name":"Shoes"},

  ];

  final List<Map<String, String>> products = [
    {"image": "assets/images/image7.png", "name": "24K Gold Elegantly crafted with lustrous pearls", "price": "USD 50"},
    {"image": "assets/images/image8.png", "name": "24K Gold Elegantly crafted with lustrous pearls", "price": "USD 70"},
    {"image": "assets/images/image9.png", "name": "24K Gold Elegantly crafted with lustrous pearls", "price": "USD 120"},
    {"image": "assets/images/image10.png", "name": "24K Gold Elegantly crafted with lustrous pearls", "price": "USD 25"},
    {"image": "assets/images/image11.png", "name": "24K Gold Elegantly crafted with lustrous pearls", "price": "USD 90"},
    {"image": "assets/images/image12.png", "name": "24K Gold Elegantly crafted with lustrous pearls", "price": "USD 40"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 50,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: Image.asset(
                      "assets/images/image1.png",
                      width: double.infinity,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 143.0),
                    child: Text(
                      "GET THEM ALL",
                      style: TextStyle(
                        fontSize: 16,
                        letterSpacing: 0.39 * 16,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        shadows: [
                          Shadow(
                            color: Colors.black45,
                            offset: Offset(2, 2),
                            blurRadius: 4,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 24,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                "Category",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
            ),

            const SizedBox(height: 12),

            SizedBox(
              height: 120,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 15),
                itemCount: images.length,
                separatorBuilder: (context, index) => SizedBox(width: 15),
                itemBuilder: (context, index) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width:72,
                        height: 72,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xFFF3F4F6)

                        ),
                       child: Image.asset(images[index]["image"]!),
                      ),
                      SizedBox(height: 10),
                      Text(
                        images[index]["name"]!,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  );
                },

              ),
            ),

            const SizedBox(height: 25),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                "Promoted Items",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
            ),

            const SizedBox(height: 15),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: GridView.builder(
                physics: NeverScrollableScrollPhysics(), // Let parent scroll
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                  childAspectRatio: 0.75,
                ),
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return ProductCard(
                    image: products[index]["image"]!,
                    name: products[index]["name"]!,
                    price: products[index]["price"]!,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProductCard extends StatefulWidget {
  final String image;
  final String name;
  final String price;

  ProductCard({
    required this.image,
    required this.name,
    required this.price,
  });

  @override
  _ProductCardState createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        // boxShadow: [
        //   BoxShadow(
        //     color: Colors.black12,
        //     spreadRadius: 1,
        //     blurRadius: 5,
        //     offset: Offset(0, 3),
        //   ),
        // ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Stack(
              children: [
                ClipRRect(
                  child: Image.asset(
                    widget.image,
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 8,),
          Text(
            widget.name,
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 14,
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.price,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: Colors.black,
                  ),
                ),
                   GestureDetector(
                    onTap: () {
                      setState(() {
                        isFavorite = !isFavorite;
                      });
                    },
                    child: Icon(
                      isFavorite ? Icons.favorite : Icons.favorite_border,
                      color: isFavorite ? Colors.red : Colors.green,
                      size: 24,
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
