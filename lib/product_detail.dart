import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_task/data/models/product_listing_model.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ProductDetail extends StatefulWidget {
  final Product? productD;
  const ProductDetail({super.key, this.productD});

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  final PageController _controller = PageController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Agar productD null ho toh static values use karo
    final bool hasData = widget.productD != null;

    final product = widget.productD;

    final List<String> staticImages = [
      "assets/images/image12.png",
      "assets/images/image11.png",
      "assets/images/image10.png",
      "assets/images/image9.png",
    ];

    final List<String> images = hasData && product!.images.isNotEmpty
        ? product.images
        : staticImages;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 390,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  PageView(
                    controller: _controller,
                    children: images.map((img) {
                      Center(child: CircularProgressIndicator());
                      return hasData

                          ? CachedNetworkImage(
                        imageUrl: img,
                        fit: BoxFit.cover,
                        placeholder: (context, url) => const Center(

                          child: CircularProgressIndicator(),
                        ),
                        errorWidget: (_, __, ___) => const Icon(Icons.broken_image, size: 50),)
                          : Image.asset(img, fit: BoxFit.cover);
                    }).toList(),
                  ),
                  Positioned(
                    bottom: 315,
                    left: 10,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Image.asset("assets/images/BackArrow.png",
                          width: 42, height: 42),
                    ),
                  ),
                  Positioned(
                    bottom: 315,
                    right: 60,
                    child: Image.asset("assets/images/icon1.png",
                        width: 42, height: 42),
                  ),
                  Positioned(
                    bottom: 315,
                    right: 10,
                    child: Image.asset("assets/images/icon2.png",
                        width: 42, height: 42),
                  ),
                  Positioned(
                    bottom: 12,
                    child: SmoothPageIndicator(
                      controller: _controller,
                      count: images.length,
                      effect: ExpandingDotsEffect(
                        dotHeight: 8,
                        dotWidth: 8,
                        activeDotColor: Colors.grey.shade500,
                        dotColor: Colors.grey.shade300,
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 120,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 15),
                itemCount: images.length,
                separatorBuilder: (context, index) => const SizedBox(width: 15),
                itemBuilder: (context, index) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 72,
                        height: 72,
                        child: hasData
                            ? Image.network(images[index], fit: BoxFit.cover)
                            : Image.asset(images[index], fit: BoxFit.cover),
                      )
                    ],

                  );
                },
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                hasData
                    ? product!.name
                    : "Luxurious Gucci Laptop Bag Embellished with Stunning Pearls",
                style:
                const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                hasData
                    ? product!.description
                    : "Elevate your style with this luxurious Gucci laptop bag, beautifully adorned with exquisite pearls and elegant gold accents. Perfect for the modern professional, this bag combines functionality with high fashion, ensuring your laptop is both secure and stylish.",
                style:
                const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
              ),
            ),
            const SizedBox(height: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 24, left: 20),
                  child: Text("Product details:",
                      style:
                      TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
                ),
                const SizedBox(height: 30),

                _buildRow("Price",
                    hasData ? "USD ${product!.price}" : "USD 850",
                    negotiable: hasData ? product!.isNegotiable : true),
                _buildRow(
                    "Condition", hasData ? product!.condition : "Excellent"),
                _buildRow("Category", hasData ? product!.category : "Bag"),
                _buildRow("Location", hasData ? product!.location : "New York"),
                _buildRow("Material", hasData ? product!.material : "Leather"),
                _buildRow("Color", hasData ? product!.color : "Brown"),
                const Padding(
                  padding: EdgeInsets.only(top: 24, left: 20),
                  child: Text("Seller details:",
                      style:
                      TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
                ),
                const SizedBox(height: 30),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100)),
                        child: Image.asset("assets/images/image14.png",
                            fit: BoxFit.cover),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: Text("John Doe",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 20)),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: Text("Joined Since 2019",
                              style: TextStyle(
                                  fontWeight: FontWeight.w400, fontSize: 14)),
                        )
                      ],
                    )
                  ],
                ),
              ],
            ),

            // Seller note
            const Padding(
              padding: EdgeInsets.only(top: 24, left: 20),
              child: Text("Seller’s note",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 6, left: 20, right: 20),
              child: Text(
                hasData
                    ? product!.addNote ?? "No note provided"
                    : "Thank you for considering our luxurious Gucci laptop bag! This stunning piece is adorned with exquisite pearls and elegant gold accents, making it the perfect accessory for the modern professional.",
                style:
                const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
              ),
            ),
            const SizedBox(height: 50),

            // Buttons
            Center(
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.only(left: 62, right: 62, top: 13,bottom: 13),
                  fixedSize: const Size(350, 48),
                  backgroundColor: const Color(0xFF32B780),
                  foregroundColor: Colors.white,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero),
                  textStyle: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    decoration: TextDecoration.none,
                  ),
                ),
                child: const Text("Chat with seller"),
              ),
            ),
            Center(
              child: TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  fixedSize: const Size(350, 60),
                  foregroundColor: const Color(0xFF32B780),
                  textStyle: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                child: const Text("Report"),
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _buildRow(String label, String value, {bool negotiable = false}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(label,
              style:
              const TextStyle(fontSize: 16, fontWeight: FontWeight.w400)),
        ),
        const Spacer(),
        if (label == "Price" && negotiable)
          DecoratedBox(
            decoration: BoxDecoration(
                color: const Color(0xFFECFDF5),
                borderRadius: BorderRadius.circular(20)),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              child: Text("Negotiable",
                  style: TextStyle(fontSize: 10, color: Color(0xFF32B780))),
            ),
          ),
        Padding(
          padding: const EdgeInsets.only(right: 30, left: 10),
          child: Text(value,
              style:
              const TextStyle(fontSize: 16, fontWeight: FontWeight.w400)),
        ),
      ],
    );
  }
}
