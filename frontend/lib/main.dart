// import 'dart:js';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tenantconnect/pages/Tenants.dart';
import 'package:tenantconnect/pages/home.dart';
import 'package:tenantconnect/pages/landlord.dart';
import 'package:tenantconnect/pages/register.dart';
import 'package:tenantconnect/userprovider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
    create: (context)=>UserProvider(),
    child: const MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TenantConnect',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,

      initialRoute: '/',
      routes: {
        '/': (context)=> MyHomePage(),
        '/register':(context)=> Register(),
        '/tenants':(context)=> Tenants(),
        '/landlord':(context)=> Landlord(),
      },
    );
  }
}

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}