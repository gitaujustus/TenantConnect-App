import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class RegisterData {
  String fullName = '';
  String email = '';
  String role = '';
  String password = '';
  String confirmPassword = '';
}

String? selectedRole;

class _RegisterState extends State<Register> {
  final RegisterData registerData = RegisterData();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register"),
        centerTitle: true,
        elevation: 0,
      ),
      backgroundColor: Color.fromARGB(255, 252, 238, 243),
      body: Container(
        padding: EdgeInsets.fromLTRB(38, 30, 38, 0),
        // color: Color.fromARGB(255, 252, 238, 243),
        child: SingleChildScrollView(
          child: Form(
            child: Column(
              children: [
                TextField(
                  onChanged: (value) {
                    registerData.fullName = value;
                  },
                  decoration: InputDecoration(
                      labelText: "Full Name",
                      hintText: "123@company.com",
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
                    registerData.email = value;
                  },
                  decoration: InputDecoration(
                      labelText: "Email",
                      hintText: "123@company.com",
                      border: OutlineInputBorder(),
                      fillColor: Colors.white,
                      filled: true,
                      errorStyle: TextStyle(color: Colors.red)),
                ),
                SizedBox(
                  height: 10,
                ),
                DropdownButtonFormField<String>(
                  value: selectedRole,
                  items: [
                    DropdownMenuItem(
                      value: "LANDLORD",
                      child: const Text("Landlord"),
                    ),
                    DropdownMenuItem(value: "TENANT", child: Text("Tenants"))
                  ],
                  onChanged: (value) {
                    setState(() => {selectedRole = value});
                  },
                  decoration: InputDecoration(
                      labelText: 'Role',
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
                    registerData.password = value;
                  },
                  decoration: InputDecoration(
                      labelText: "Password",
                      hintText: "**********",
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
                    registerData.confirmPassword = value;
                  },
                  decoration: InputDecoration(
                    labelText: "Confirm password",
                    hintText: "**********",
                    border: OutlineInputBorder(), // Add a rounded border
                    fillColor:
                        Colors.white, // Fill the text field with white color
                    filled: true, // Enable filling
                    errorStyle: TextStyle(color: Colors.red),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  onPressed: () async {
                    print(selectedRole);
                    if (registerData.password != registerData.confirmPassword) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Password must be the same'),
                          duration: Duration(seconds: 2),
                        ),
                      );
                      return;
                    }
                    final String register =
                        'http://localhost:8000/api/register';
                    try {
                      final response = await http.post(
                        Uri.parse(register),
                        headers: <String, String>{
                          'Content-Type': 'application/json',
                        },
                        body: jsonEncode({
                          'fullname': registerData.fullName,
                          'email': registerData.email,
                          'role': selectedRole,
                          'password': registerData.password,
                          'userID': 2,
                        }),
                      );

                      if (response.statusCode == 200) {
                        // Registration successful
                        print('Registration successful: ${response.body}');
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Account created successfully!'),
                            duration: Duration(seconds: 2),
                          ),
                        );
                        // Navigate to login screen
                        Navigator.pushNamed(context, '/');
                      } else {
                        // Handle other errors
                        print(
                            'Failed to register. Status code: ${response.statusCode}');
                        print('Responseeeeee: ${response.body}');
                      }
                    } catch (e) {
                      // Handle exceptions
                      print('Error: $e');
                    }
                  },
                  child: Text(
                    "Register",
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                      Color.fromARGB(255, 127, 127, 242),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
