import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const JHomesApp());
}

class JHomesApp extends StatelessWidget {
  const JHomesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'JHomes - Property Rental Solutions',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        scaffoldBackgroundColor: const Color(0xFFA5C3C6),
        fontFamily: 'Roboto',
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  HomePage({super.key});
  List<Map<String, String>> titleImage = [
    {
      "title": "Renting Made Easy: Tips for Landlords, Tenants & Vendors",
      "img": "assets/images/1.jpg",
    },
    {
      "title": "Landlord-Tenant Laws: Key Rights & Responsibilities",
      "img": "assets/images/2.jpg",
    },
    {
      "title":
          "Avoiding Common Rental Disputes: A Guide for Landlords & Tenants",
      "img": "assets/images/3.jpg",
    },
    {
      "title":
          "The Future of Property Management: Trends for Landlords & Vendors",
      "img": "assets/images/4.jpg",
    },
    {
      "title": "Maximizing Rental Income: Strategies for Smart Landlords",
      "img": "assets/images/5.jpg",
    },
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'JHomes - Property Rental Solutions',
      home: Scaffold(
        extendBodyBehindAppBar: true,

        body:  ListView.builder(
          itemCount: titleImage.length,
          
          itemBuilder: (context, index) {
            return BlogCard(title: titleImage[index]["title"]!,img: titleImage[index]["img"]!,);
          },
        ),

        //  GridView.builder(
        //           scrollDirection: Axis.horizontal,
        //           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        //             crossAxisCount: 2,
        //             childAspectRatio: 0.5,
        //           ),
        //           itemCount: 20,
        //           itemBuilder: (context, index) {
        //             return Card(
        //               child: Container(
        //                 height: 200,
        //                 width: 200,
        //                 color: Colors.primaries[index % 9],
        //               ),
        //             );
        //           },
        //         ),

       

        //   ListView(
        //     children: [
        //       Column(
        //         children: [
        //           // HowWorks(),
        //           // OpenRentels(),

        //           ListTile(
        //             leading: CircleAvatar(child: Text('1')),
        //             title: Text('Item One'),
        //             subtitle: Text('Subtitle'),
        //             trailing: Icon(Icons.arrow_forward),
        //             onTap: () {},
        //           ),
        //           Divider(),
        //           ListTile(
        //             leading: CircleAvatar(child: Text('2')),
        //             title: Text('Item Two'),
        //           ),
        //         ],
        //       ),
        //     ],
        //   ),
        // ),
      ),
    );
  }
}

class BlogCard extends StatelessWidget {
 const  new({super.key, required this.title, required this.img});
final  String title, img;
  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 10,
          children: [
            Image(image: AssetImage(img)),
            Text(
              "February 20, 2025",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight(400),
                color: Colors.blueGrey,
              ),
            ),
            Text(
              title,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight(600)),
            ),
            Text(
              "Read More",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight(600),
                color: Colors.teal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RentalsCard extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Card(
        margin: EdgeInsets.all(10),

        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              // cover image
              Container(
                height: double.maxFinite,
                width: double.maxFinite,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(13),
                  border: Border.all(color: Colors.white24, width: 3),
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(
                      "https://i.ibb.co.com/N6G0KWSD/fba1e577cb6e4afe22291acb687276899f8f68a6-1.jpg",
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Image(image: AssetImage("assets/icons/map-pin-5-line.png")),
                  SizedBox(width: 15),
                  Text(
                    "New York, United States",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(height: 15),
              Text(
                "A fully furnished studio with modern decor, a compact kitchen, and large windows.",
                style: GoogleFonts.onest(
                  textStyle: TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
              SizedBox(height: 15),
              Row(
                spacing: 18,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "March 2025",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  CircleAvatar(backgroundColor: Colors.teal, radius: 5),
                  Text(
                    "₦ 1,200/ month",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class OpenRentels extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.white24, width: 1),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: Text(
              "Featured Open Rentals",
              style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.white24, width: 1),
            ),
            child: Column(
              children: [
                // cover image
                Container(
                  height: 300,
                  width: 400,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(13),
                    border: Border.all(color: Colors.white24, width: 3),
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage(
                        "https://i.ibb.co.com/N6G0KWSD/fba1e577cb6e4afe22291acb687276899f8f68a6-1.jpg",
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Image(image: AssetImage("assets/icons/map-pin-5-line.png")),
                    SizedBox(width: 15),
                    Text(
                      "New York, United States",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15),
                Text(
                  "A fully furnished studio with modern decor, a compact kitchen, and large windows.",
                  style: GoogleFonts.onest(
                    textStyle: TextStyle(
                      color: Colors.blueGrey,
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
                SizedBox(height: 15),
                Row(
                  spacing: 18,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "March 2025",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    CircleAvatar(backgroundColor: Colors.teal, radius: 5),
                    Text(
                      "₦ 1,200/ month",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
