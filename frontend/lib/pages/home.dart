import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class LoginDetails {
  String username = "";
  String password = "";
}

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
                            hintText: 'John Doe',
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
                            onPressed: () {
                              print("Username:" + loginDetails.username);
                              print("Password:" + loginDetails.password);
                              // Show pop-up screen with message
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text('Coming Soon'),
                                    content: Text('This feature will be available soon!'),
                                    actions: [
                                      ElevatedButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: Text('OK'),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                            child: Text(
                              'Login',
                              style: TextStyle(color: Colors.white),
                            ),
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Color.fromARGB(255, 127, 127, 242)))),
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


