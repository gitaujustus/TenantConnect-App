import 'package:flutter/material.dart';

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

class _RegisterState extends State<Register> {
  String? selectedRole;
  final RegisterData registerData = RegisterData();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Register"),
          centerTitle: true,
          elevation: 0,
        ),
        backgroundColor: Color.fromARGB(255, 252, 238, 243) ,
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
                            labelText: "Full Name", hintText: "123@company.com",
                            border: OutlineInputBorder(),
                            fillColor: Colors.white,
                          filled: true,
                            errorStyle: TextStyle(color: Colors.red)
                            
                            ),
                      ),
                    SizedBox(height: 10,),
            
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
                          errorStyle: TextStyle(color: Colors.red)
                          
                          ),
                    ),
            
                    SizedBox(height: 10,),
            
                    DropdownButtonFormField<String>(
                      value: selectedRole,
                      items: [
                        DropdownMenuItem(
                          value: "LandLord",
                          child: const Text("Landlord"),
                        ),
                        DropdownMenuItem(value: "Tenants", child: Text("Tenants"))
                      ],
                      onChanged: (value) {
                        setState(() => {selectedRole = value});
                      },
                      decoration: InputDecoration(
                        labelText: 'Role',
                        border: OutlineInputBorder(),
                        fillColor: Colors.white,
                        filled: true,
                        errorStyle: TextStyle(color: Colors.red)
                      ),
                    ),
            
                    SizedBox(height: 10,),
            
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
                          errorStyle: TextStyle(color: Colors.red)
                          ),
                          
                          
                    ),
            
                    SizedBox(height: 10,),
            
            
                    TextField(
                       onChanged: (value) {
                      registerData.confirmPassword = value;
                       },
                      decoration: InputDecoration(
                          labelText: "Confirm password", 
                          hintText: "**********",
                          border: OutlineInputBorder(), // Add a rounded border
                          fillColor: Colors.white, // Fill the text field with white color
                          filled: true, // Enable filling
                          errorStyle: TextStyle(color: Colors.red),
                          ),
                    ),
                      
                      SizedBox(height: 30,),
            
                    ElevatedButton(onPressed: (){
                       print('Full Name: ${registerData.fullName}');
                    print('Email: ${registerData.email}');
                    print('Role: ${registerData.role}');
                    print('Password: ${registerData.password}');
                    print('Confirm Password: ${registerData.confirmPassword}');
                    }, 
                    child: Text("Submit", style: TextStyle(color: Colors.white),),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Color.fromARGB(255, 127, 127, 242))
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
