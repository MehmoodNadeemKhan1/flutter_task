import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ProductDetail extends StatefulWidget
{
    const ProductDetail({super.key});

    @override
    State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail>
{
    final PageController _controller = PageController();

    @override
    void dispose()
    {
        _controller.dispose();
        super.dispose();
    }

    @override
    Widget build(BuildContext context)
    {

        final List<Map<String, String>> images = [
        {"image":"assets/images/image9.png"},
        {"image":"assets/images/image10.png"},
        {"image":"assets/images/image11.png"},
        {"image":"assets/images/image12.png"},
        {"image":"assets/images/image9.png"},
        {"image":"assets/images/image10.png"},
        {"image":"assets/images/image11.png"},
        {"image":"assets/images/image12.png"},
        {"image":"assets/images/image9.png"},
        {"image":"assets/images/image10.png"}
        ];

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
                                        children: [
                                            Image.asset("assets/images/image12.png", fit: BoxFit.cover),
                                            Image.asset("assets/images/image11.png", fit: BoxFit.cover),
                                            Image.asset("assets/images/image10.png", fit: BoxFit.cover),
                                            Image.asset("assets/images/image9.png", fit: BoxFit.cover)
                                        ]
                                    ),
                                    Positioned(
                                        bottom: 315,
                                        left: 10,
                                        child: GestureDetector(
                                            onTap: ()
                                            {
                                                Navigator.pop(context);
                                            },
                                            child: Image.asset("assets/images/BackArrow.png",
                                                width: 42,
                                                height: 42)
                                        )
                                    ),
                                    Positioned(
                                        bottom: 315,
                                        right: 60,
                                        child: Image.asset("assets/images/icon1.png",
                                            width: 42,
                                            height: 42)
                                    ),
                                    Positioned(
                                        bottom: 315,
                                        right: 10,
                                        child: Image.asset("assets/images/icon2.png",
                                            width: 42,
                                            height: 42)
                                    ),
                                    Positioned(
                                        bottom: 12,
                                        child: SmoothPageIndicator(
                                            controller: _controller,
                                            count: 4,
                                            effect: ExpandingDotsEffect(
                                                dotHeight: 8,
                                                dotWidth: 8,
                                                activeDotColor: Colors.grey.shade500,
                                                dotColor: Colors.grey.shade300
                                            )
                                        )
                                    )
                                ]
                            )
                        ),
                        SizedBox(
                            height: 120,
                            child: ListView.separated(
                                scrollDirection: Axis.horizontal,
                                padding: const EdgeInsets.symmetric(horizontal: 15),
                                itemCount: images.length,
                                separatorBuilder: (context, index) => SizedBox(width: 15),
                                itemBuilder: (context, index)
                                {
                                    return Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                            SizedBox(
                                                width: 72,
                                                height: 72,
                                                child: Image.asset(images[index]["image"]!,
                                                    fit: BoxFit.cover
                                                )
                                            )
                                        ]
                                    );
                                }

                            )
                        ),
                        SizedBox(height: 10),
                        Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Text("Luxurious Gucci Laptop Bag Embellished with Stunning Pearls", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700))
                        ),
                        SizedBox(height: 10),
                        Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Text("Elevate your style with this luxurious Gucci laptop bag, beautifully adorned with exquisite pearls and elegant gold accents. Perfect for the modern professional, this bag combines functionality with high fashion, ensuring your laptop is both secure and stylish.", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400))
                        ),
                        SizedBox(height: 10),
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                                Padding(
                                    padding: const EdgeInsets.only(top: 24, left: 20),
                                    child: Text("Product details:", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600))
                                ),
                                SizedBox(height: 30),
                                Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                        Padding(
                                            padding: const EdgeInsets.only(left: 20),
                                            child: Text("Price", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400))
                                        ),
                                        Spacer(),
                                        DecoratedBox(
                                            decoration: BoxDecoration(
                                                color: Color(0xFFECFDF5),
                                                borderRadius: BorderRadius.circular(20)
                                            ),
                                            child: Padding(
                                                padding: const EdgeInsets.only(right: 30),
                                                child: Text("Negotiable", style: TextStyle(fontSize: 10, color: Color(0xFF32B780)))
                                            )
                                        ),
                                        Padding(
                                            padding: const EdgeInsets.only(right: 30),
                                            child: Text("USD 850", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400))
                                        )

                                    ]
                                ),
                                Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                        Padding(
                                            padding: const EdgeInsets.only(left: 20),
                                            child: Text("Condition", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400))
                                        ),
                                        Spacer(),
                                        Padding(
                                            padding: const EdgeInsets.only(right: 30),
                                            child: Text("Excellent", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400))
                                        )

                                    ]
                                ),

                                Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                        Padding(
                                            padding: const EdgeInsets.only(left: 20),
                                            child: Text("Category", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400))
                                        ),
                                        Spacer(),
                                        Padding(
                                            padding: const EdgeInsets.only(right: 30),
                                            child: Text("Bag", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400))
                                        )

                                    ]
                                ),

                                Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                        Padding(
                                            padding: const EdgeInsets.only(left: 20),
                                            child: Text("Location", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400))
                                        ),
                                        Spacer(),
                                        Padding(
                                            padding: const EdgeInsets.only(right: 30),
                                            child: Text("New York", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400))
                                        )

                                    ]
                                ),

                                Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                        Padding(
                                            padding: const EdgeInsets.only(left: 20),
                                            child: Text("Material", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400))
                                        ),
                                        Spacer(),
                                        Padding(
                                            padding: const EdgeInsets.only(right: 30),
                                            child: Text("Leather", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400))
                                        )

                                    ]
                                ),
                                Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                        Padding(
                                            padding: const EdgeInsets.only(left: 20),
                                            child: Text("Color", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400))
                                        ),
                                        Spacer(),
                                        Padding(
                                            padding: const EdgeInsets.only(right: 30),
                                            child: Text("Brown", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400))
                                        )
                                    ]
                                ),
                                Padding(
                                    padding: const EdgeInsets.only(top: 24, left: 20),
                                    child: Text("Seller details:", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600))
                                ),
                                SizedBox(height: 30),
                                Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                        Padding(
                                            padding: const EdgeInsets.only(left: 20),
                                            child: Container(
                                                decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(100)
                                                ),
                                                child: Image.asset("assets/images/image14.png", fit: BoxFit.cover)
                                            )
                                        ),
                                        Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                                Padding(
                                                    padding: const EdgeInsets.only(left: 20),
                                                    child: Text("John Doe", style: TextStyle(
                                                            fontWeight: FontWeight.w600,
                                                            fontSize: 20
                                                        ))
                                                ),
                                                Padding(
                                                    padding: const EdgeInsets.only(left: 20),
                                                    child: Text("Joined Since 2019", style: TextStyle(
                                                            fontWeight: FontWeight.w400,
                                                            fontSize: 14
                                                        ))
                                                )
                                            ]
                                        )

                                    ]
                                )
                            ]

                        ),
                        Padding(
                            padding: const EdgeInsets.only(top: 24, left: 20),
                            child: Text("Seller’s note", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600))
                        ),
                        Padding(
                            padding: const EdgeInsets.only(top: 6, left: 20),
                            child: Text("Thank you for considering our luxurious Gucci laptop bag! This stunning piece is adorned with exquisite pearls and elegant gold accents, making it the perfect accessory for the modern professional.", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400))
                        ),
                        SizedBox(height: 50),

                        Center(
                            child: ElevatedButton(onPressed: ()
                                {
                                },
                                style: ElevatedButton.styleFrom(
                                    padding: EdgeInsets.only(left: 62, right: 62, top: 18, bottom: 18),
                                    fixedSize: Size(350, 48),
                                    backgroundColor: Color(0xFF32B780),

                                    foregroundColor: Color(0xFFFFFFFF),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.zero
                                    ),
                                    textStyle: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                      decoration: TextDecoration.none


                                    )

                                ),

                                child: Text("Chat with seller")
                            )
                        ),
                      Center(
                          child: TextButton(onPressed: ()
                          {
                          },
                              style: TextButton.styleFrom(
                                  fixedSize: Size(350, 60),
                                  foregroundColor: Color(0xFF32B780),
                                  textStyle: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                  )
                              ),
                              child: Text("Report")
                          )
                      ),
                      SizedBox(height: 30),

                    ]
                )
            )
        );
    }
}

