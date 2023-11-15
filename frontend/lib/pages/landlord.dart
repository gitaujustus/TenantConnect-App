import 'package:flutter/material.dart';
import 'package:tenantconnect/pages/Tenants.dart';

class Landlord extends StatefulWidget {
  const Landlord({super.key});

  @override
  State<Landlord> createState() => _LandlordState();
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

// List<String> properties = [];

class addProperty {
  String propertyName = "";
  String propertyPrice = "";
  String propertyLocation = "";
  String propertyDescription = "";
  String yourContacts = "";
}

class _LandlordState extends State<Landlord> {
  final addProperty addproperty = new addProperty();
  @override
  Widget build(BuildContext context) {

    List<HouseData> yourProperties = [
      HouseData(
        name: "Comeronnn becky",
        description:
            "Use a Wrap widget instead of a Row widget, which will automatically wrap its children to the next line if there is not enough space.",
        location: "Chemundu",
        price: "34 dollars",
        contact: "0729144533",
      ),
      HouseData(
        name: "John Doe",
        description: "Another house description goes here.",
        location: "City Center",
        price: "50 dollars",
        contact: "0123456789",
      ),
    ];

    return Scaffold(
      body: SingleChildScrollView(
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
              height: 290,
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
                        size: 40,
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Icon(
                    Icons.account_circle,
                    size: 70,
                    color: Colors.white,
                  ),
                  // CircleAvatar(
                  //   radius: 50,
                  //   child: Icon(Icons.account_circle, size: 100,),
                  //   // backgroundColor: Icon(icons),
                  //   // backgroundImage: AssetImage('assets/landlord_avatar.png'), // Add your landlord's avatar image
                  // ),
                  SizedBox(height: 10),
                  Text(
                    "Welcome, Landlord!",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ),
            Form(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    Text(
                      "Add Property",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextField(
                      onChanged: (value) {
                        addproperty.propertyName = value;
                      },
                      decoration: InputDecoration(
                          labelText: "Property Name",
                          border: OutlineInputBorder(),
                          fillColor: Colors.white,
                          filled: true,
                          errorStyle: TextStyle(color: Colors.red)),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextField(
                      onChanged: (value) {
                        addproperty.propertyDescription = value;
                      },
                      decoration: InputDecoration(
                          labelText: "Property Description",
                          border: OutlineInputBorder(),
                          fillColor: Colors.white,
                          filled: true,
                          errorStyle: TextStyle(color: Colors.red)),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextField(
                      onChanged: (value) {
                        addproperty.propertyLocation = value;
                      },
                      decoration: InputDecoration(
                          labelText: "Property Location",
                          border: OutlineInputBorder(),
                          fillColor: Colors.white,
                          filled: true,
                          errorStyle: TextStyle(color: Colors.red)),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextField(
                      onChanged: (value) {
                        addproperty.propertyPrice = value;
                      },
                      decoration: InputDecoration(
                          labelText: "Property Price",
                          border: OutlineInputBorder(),
                          fillColor: Colors.white,
                          filled: true,
                          errorStyle: TextStyle(color: Colors.red)),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextField(
                      onChanged: (value) {
                        addproperty.yourContacts = value;
                      },
                      decoration: InputDecoration(
                          labelText: "Your Contactss",
                          border: OutlineInputBorder(),
                          fillColor: Colors.white,
                          filled: true,
                          errorStyle: TextStyle(color: Colors.red)),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        print("PropertName: " + addproperty.propertyName);
                        print("propertyDescription: " +
                            addproperty.propertyDescription);
                        print("propertyLocation: " +
                            addproperty.propertyLocation);
                      },
                      child: Text(
                        "Submit",
                        style: TextStyle(color: Colors.white),
                      ),
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Color.fromARGB(255, 127, 127, 242))),
                    )
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Your Properties',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  // Check if properties list is empty
                  yourProperties.isEmpty
                      ? Text('You have not added any property.')
                      : Column(
                          // Display list of properties
                          children: yourProperties
                              .map((property) =>
                                  PropertyCard(property))
                              .toList(),
                        ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class PropertyCard extends StatelessWidget {
  final HouseData property;
  PropertyCard(this.property);

  @override
  Widget build(BuildContext context) {
    return Card(
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
                    property.name,
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    property.description,
                    style: TextStyle(
                      fontSize: 15.0,
                    ),
                  ),
                  Text(
                    "LOCATION: ${property.location}",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "PRICE: ${property.price}",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "CONTACTS: ${property.contact}",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
