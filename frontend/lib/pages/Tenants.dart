import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:tenantconnect/userprovider.dart';

class Tenants extends StatefulWidget {
  const Tenants({super.key});

  @override
  State<Tenants> createState() => _TenantsState();
}

class HouseData {
  final String name;
  final String description;
  final String location;
  final String price;
  final String contact;

  HouseData({
    required this.name,
    required this.description,
    required this.location,
    required this.price,
    required this.contact,
  });
}

class _TenantsState extends State<Tenants> {
  List<HouseData> houseList = [
    // HouseData(
    //   name: "Comeronnn becky",
    //   description:
    //       "Use a Wrap widget instead of a Row widget, which will automatically wrap its children to the next line if there is not enough space.",
    //   location: "Chemundu",
    //   price: "34 dollars",
    //   contact: "0729144533",
    // ),
    // // Add more house data as needed
  ];

  @override
  void initState() {
    super.initState();
    // Call a function to fetch data when the widget is first created
    fetchData();
  }

  Future<void> fetchData() async {
    final String getData = 'http://localhost:8000/api/getproperties';
    try {
      final response = await http.get(Uri.parse(getData));

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        if (data["success"] == true) {
          final List<dynamic> properties = data['properties'];
          final List<HouseData> fetchedHouses = properties.map((property) {
            return HouseData(
              name: property['propertyName'],
              description: property['description'],
              location: property['location'],
              price: property['price'],
              contact: property['contact'],
            );
          }).toList();
          setState(() {
            houseList = fetchedHouses;
          });
        } else {
          print('Failed to fetch houses. Status code: ${response.statusCode}');
        }
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    String? username =
        Provider.of<UserProvider>(context, listen: false).userName;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30.0),
                    bottomRight: Radius.circular(30.0),
                  ),
                ),
                height: 300,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Hi",
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        Icon(
                          Icons.waving_hand,
                          color: const Color.fromARGB(255, 255, 195, 16),
                          size: 30,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "${username}",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Text(
                      "Welcome, Get Accomodation!",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              HouseCard(houseList: houseList),
            ],
          ),
        ),
      ),
    );
  }
}

class HouseCard extends StatelessWidget {
  const HouseCard({
    super.key,
    required this.houseList,
  });

  final List<HouseData> houseList;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        houseList.length,
        (index) => Card(
          elevation: 5.0,
          color: Colors.white,
          margin: EdgeInsets.all(6),
          child: Container(
            width: 400,
            height: 150, // Adjust the height based on your content
            child: Row(
              children: [
                Icon(Icons.home, size: 70, color: Colors.black),
                SizedBox(width: 10),
                Expanded(
                  child: Wrap(
                    spacing: 8.0, // Adjust spacing between wrapped items
                    runSpacing: 4.0, // Adjust spacing between lines
                    children: [
                      Text(
                        houseList[index].name,
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        houseList[index].description,
                        style: TextStyle(
                          fontSize: 15.0,
                        ),
                      ),
                      Text(
                        "LOCATION: ${houseList[index].location}",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "PRICE: ${houseList[index].price}",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "CONTACTS: ${houseList[index].contact}",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
