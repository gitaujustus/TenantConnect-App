import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:tenantconnect/userprovider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class LoginDetails {
  String username = "";
  String password = "";
}

// class UserProvider extends ChangeNotifier {
//   String? userEmail;
//   String? role;

//   void setUser(String email, String userRole) {
//     userEmail = email;
//     role = userRole;
//     notifyListeners();
//   }
// }

class _MyHomePageState extends State<MyHomePage> {
  final LoginDetails loginDetails = new LoginDetails();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          const Color.fromARGB(255, 252, 238, 243), // appBar: AppBar(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 70.0),
                Text(
                  "Welcome to",
                  style: TextStyle(fontSize: 30.0),
                ),
                Text(
                  "TenantConnect",
                  style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold),
                ),
                Icon(
                  Icons.house,
                  size: 60,
                  color: Colors.blueAccent,
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                    padding: EdgeInsets.fromLTRB(38, 20, 38, 10),
                    child: Form(
                        child: Column(
                      children: [
                        TextField(
                          onChanged: (value) => {loginDetails.username = value},
                          decoration: InputDecoration(
                            labelText: 'Username',
                            hintText: 'Justus Gitau',
                            border: OutlineInputBorder(),
                            errorStyle: TextStyle(color: Colors.red),
                            hintStyle: TextStyle(
                                color:
                                    const Color.fromARGB(255, 223, 222, 222)),
                            fillColor: Colors.white,
                            filled: true,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextField(
                          onChanged: (value) => {loginDetails.password = value},
                          obscureText: true,
                          decoration: InputDecoration(
                              labelText: 'Password',
                              hintText: '**********',
                              border: OutlineInputBorder(),
                              fillColor: Colors.white,
                              errorStyle: TextStyle(color: Colors.white),
                              hintStyle: TextStyle(
                                  color:
                                      const Color.fromARGB(255, 223, 222, 222)),
                              filled: true),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                          onPressed: () async {
                            print("Clicked");
                            // Construct the URL
                            final String apiUrl =
                                'http://localhost:8000/api/login';

                            try {
                              // Send a POST request to the endpoint with the message "Hello"
                              final response = await http.post(
                                Uri.parse(apiUrl),
                                headers: <String, String>{
                                  'Content-Type': 'application/json',
                                },
                                body: jsonEncode({
                                  'username': loginDetails.username,
                                  'password': loginDetails.password,
                                }),
                              );

                              if (response.statusCode == 200) {
                                // Successful request
                                print("Successful request");
                                Map<String, dynamic> responseData =
                                    json.decode(response.body);
                                String email = responseData['userEmail'];
                                String fullname = responseData['fullname'];
                                String role = responseData['role'];
                                int id = responseData['id'];
                                print(responseData['id']);

                                // Access UserProvider and update user data
                                UserProvider userProvider =
                                    Provider.of<UserProvider>(context,
                                        listen: false);
                                userProvider.setUser(fullname, email, role, id);
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text('Login successful'),
                                    duration: Duration(seconds: 1),
                                  ),
                                );
                                if (role == 'TENANT') {
                                  print("He is a tenant");
                                  Navigator.pushNamed(context, '/tenants');
                                } else if (role == 'LANDLORD') {
                                  print("He is a landlord");
                                  Navigator.pushNamed(context, '/landlord');
                                }
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'Invalid login. Please check your credentials.',
                                      style: TextStyle(color: Colors.redAccent),
                                    ),
                                  ),
                                );
                                // Handle error
                                print(
                                    'Failed to send request. Status code: ${response.statusCode}');
                                print('Response: ${response.body}');
                              }
                            } catch (error) {
                              // Handle exceptions
                              print('Error: $error');
                            }
                          },
                          child: Text(
                            'Login',
                            style: TextStyle(color: Colors.white),
                          ),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                              Color.fromARGB(255, 127, 127, 242),
                            ),
                          ),
                        )
                      ],
                    ))),
                SizedBox(
                  height: 55,
                ),
                Text("Don't Have an account?"),
                TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, "/register");
                    },
                    child: Text(
                      'Register here',
                      style: TextStyle(
                          color: Colors.blue,
                          decoration: TextDecoration.underline),
                    )),
                TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, "/tenants");
                    },
                    child: Text(
                      'Tenants',
                      style: TextStyle(
                          color: Colors.blue,
                          decoration: TextDecoration.underline),
                    )),
                TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, "/landlord");
                    },
                    child: Text(
                      'Landlord',
                      style: TextStyle(
                          color: Colors.blue,
                          decoration: TextDecoration.underline),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
