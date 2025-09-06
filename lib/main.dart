import 'package:flutter/material.dart';
import 'package:flutter_task/CreateList.dart';
import 'package:flutter_task/product_detail.dart';
import 'package:flutter_task/showproducts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:svg_flutter/svg.dart';

void main()
{
    runApp(MyApp());
}

class MyApp extends StatelessWidget
{
    @override
    Widget build(BuildContext build)
    {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'Urbanist',
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.grey.shade500,
          ),
        ),
        home: BottomNavigation(),
      );

    }
}

class HomeScreen extends StatelessWidget
{

  String getGreeting(){
    final hour = DateTime.now().hour;

    if (hour >= 5 && hour < 12) {
      return "Good Morning";
    } else if (hour >= 12 && hour < 17) {
      return "Good Afternoon";
    } else if (hour >= 17 && hour < 21) {
      return "Good Evening";
    } else {
      return "Good Night";
    }
  }

    final List<Map<String, String>> images = [
    {"image":"assets/images/image2.png", "name":"Shoes"},
    {"image":"assets/images/image3.png","name":"Shoes"},
    {"image":"assets/images/image4.png","name":"Shoes"},
    {"image":"assets/images/image5.png","name":"Shoes"},
    {"image":"assets/images/image6.png","name":"Shoes"},
    {"image":"assets/images/image2.png","name":"Shoes"},
    {"image":"assets/images/image3.png","name":"Shoes"},
    {"image":"assets/images/image4.png","name":"Shoes"},
    {"image":"assets/images/image5.png","name":"Shoes"},
    {"image":"assets/images/image6.png","name":"Shoes"}

    ];

    final List<Map<String, String>> products = [
    {"image": "assets/images/image7.png", "name": "24K Gold Elegantly crafted with lustrous pearls", "price": "USD 50"},
    {"image": "assets/images/image8.png", "name": "24K Gold Elegantly crafted with lustrous pearls", "price": "USD 70"},
    {"image": "assets/images/image9.png", "name": "24K Gold Elegantly crafted with lustrous pearls", "price": "USD 120"},
    {"image": "assets/images/image10.png", "name": "24K Gold Elegantly crafted with lustrous pearls", "price": "USD 25"},
    {"image": "assets/images/image11.png", "name": "24K Gold Elegantly crafted with lustrous pearls", "price": "USD 90"},
    {"image": "assets/images/image12.png", "name": "24K Gold Elegantly crafted with lustrous pearls", "price": "USD 40"}
    ];


    @override
    Widget build(BuildContext context)
    {
        return Scaffold(
            backgroundColor: Colors.white,
            body: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                        Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: AppBar(
                                leading: Image.asset('assets/images/image13.png'),
                                leadingWidth: 30.27,
                                titleSpacing: 12,
                                title: Text("${getGreeting()} Alex!"),
                                forceMaterialTransparency: true,
                                actions: [SizedBox(width: 18.08), Image.asset('assets/images/Vector.png'), SizedBox(width: 18.08), SvgPicture.asset('assets/images/bell.svg')]
                            )
                        ),
                        SizedBox(height: 24),
                        Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: TextField(

                                decoration: InputDecoration(
                                    hint: Text("Explore to next purchase."),

                                    prefixIcon: Image.asset("assets/images/Search.png"),
                                    suffixIcon: Image.asset("assets/images/filter.png"),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(4)
                                    )

                                )
                            )
                        ),
                        SizedBox(height: 24),
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
                                            fit: BoxFit.fill
                                        )
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
                                                        blurRadius: 4
                                                    )
                                                ]
                                            )
                                        )
                                    )
                                ]
                            )
                        ),
                        SizedBox(height: 24),
                        Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Text(
                                "Category",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black87
                                )
                            )
                        ),

                        const SizedBox(height: 12),

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
                                            Container(
                                                width: 72,
                                                height: 72,
                                                padding: EdgeInsets.all(10),
                                                decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: Color(0xFFF3F4F6)

                                                ),
                                                child: Image.asset(images[index]["image"]!)
                                            ),
                                            SizedBox(height: 10),
                                            Text(
                                                images[index]["name"]!,
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w500
                                                )
                                            )
                                        ]
                                    );
                                }

                            )
                        ),

                        const SizedBox(height: 25),

                        Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Text(
                                "Promoted Items",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black87
                                )
                            )
                        ),

                        const SizedBox(height: 15),

                        Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15.0),
                            child: GridView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 15,
                                    mainAxisSpacing: 15,
                                    childAspectRatio: 0.75
                                ),
                                itemCount: products.length,
                                itemBuilder: (context, index)
                                {
                                    return ProductCard(
                                        image: products[index]["image"]!,
                                        name: products[index]["name"]!,
                                        price: products[index]["price"]!
                                    );
                                }
                            )
                        )
                    ]
                )
            )
        );
    }
}

class ProductCard extends StatefulWidget
{
    final String image;
    final String name;
    final String price;

    ProductCard({
        required this.image,
        required this.name,
        required this.price
    });

    @override
    _ProductCardState createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard>
{
    bool isFavorite = false;

    @override
    Widget build(BuildContext context)
    {
        return Container(
            decoration: BoxDecoration(
                color: Colors.white
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
                        child: GestureDetector(
                            onTap: ()
                            {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ProductDetail()
                                    )
                                );
                            },

                            child: Stack(
                                children: [
                                    ClipRRect(
                                        child: Image.asset(
                                            widget.image,
                                            fit: BoxFit.cover,
                                            width: double.infinity
                                        )
                                    )
                                ]
                            )
                        )
                    ),
                    SizedBox(height: 8),
                    Text(
                        widget.name,
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14
                        )
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
                                        color: Colors.black
                                    )
                                ),
                                GestureDetector(
                                    onTap: ()
                                    {
                                        setState(()
                                            {
                                                isFavorite = !isFavorite;
                                            }
                                        );
                                    },
                                    child: Icon(
                                        isFavorite ? Icons.favorite : Icons.favorite_border,
                                        color: isFavorite ? Colors.red : Colors.green,
                                        size: 24
                                    )
                                )
                            ]
                        )
                    )
                ]
            )
        );
    }

}

class BottomNavigation extends StatefulWidget
{
    const BottomNavigation({super.key});

    @override
    State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation>
{
    int _selectedIndex = 0;

    static const TextStyle optionStyle =
        TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

    static final List<Widget> _widgetOptions = <Widget>[
        HomeScreen(),
       Showproducts(),
        const Text('Index 2: Chat', style: optionStyle),
        const Text('Index 3: Settings', style: optionStyle)

    ];

    void _onItemTapped(int index)
    {
        setState(()
            {
                _selectedIndex = index;
            }
        );
    }

    @override
    Widget build(BuildContext context)
    {
        return Scaffold(
            body: Center(
                child: _widgetOptions[_selectedIndex]
            ),
            floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
            floatingActionButton: FloatingActionButton(
                onPressed: ()
                {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Createlist())
                    );
                },
                backgroundColor: Color(0xFFF3F4F6),
                foregroundColor: Colors.black87,
                elevation: 20,
                shape: const CircleBorder(),
                child: Container(
                    width: 39.67,
                    height: 39.67,
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xFF32b780)
                    ),
                    child: const Icon(Icons.add))

            ),
            bottomNavigationBar: ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
                child: BottomAppBar(
                    shape: const CircularNotchedRectangle(),
                    notchMargin: 6.0,
                    color: Color(0xFFF3F4F6),
                    child: SizedBox(
                        height: 60,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                                IconButton(
                                    icon: Icon(
                                        _selectedIndex == 0 ? Iconsax.home_21 : Iconsax.home_24
                                    ),
                                    color: Colors.black87,
                                    onPressed: () => _onItemTapped(0)
                                ),
                                IconButton(
                                    icon: Icon(
                                        _selectedIndex == 1 ? Iconsax.category_24 : Iconsax.category_24
                                    ),
                                    color: Colors.black87,
                                    onPressed: () => _onItemTapped(1)
                                ),
                                const SizedBox(width: 40),
                                IconButton(
                                    icon: Icon(
                                        _selectedIndex == 2 ? Icons.chat : Icons.chat_outlined
                                    ),
                                    color: Colors.black87,
                                    onPressed: () => _onItemTapped(2)
                                ),
                                IconButton(
                                    icon: Icon(
                                        _selectedIndex == 3 ? Icons.settings : Icons.settings_outlined
                                    ),
                                    color: Colors.black87,
                                    onPressed: () => _onItemTapped(3)
                                )
                            ]
                        )
                    )
                )
            )
        );
    }
}




