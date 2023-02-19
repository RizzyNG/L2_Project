import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:l2_harizhadi_project/screens/home_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:l2_harizhadi_project/screens/BookingScreens/CartProvider.dart';
import 'package:l2_harizhadi_project/screens/BookingScreens/ProductPage.dart';
import 'package:l2_harizhadi_project/screens/StartingScreens/login_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  return runApp(
    ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login/LogOut Stuff',
      routes: {
        '/login': (context) => LoginPage(),
        '/home': (context) => Home(),
        '/productpage': (context) => ProductPage(),
      },
      home: LoginPage(),
      // home: ProductPage(),
    );
  }
}

class MyCartApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cart Stuff',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: ProductPage(),
    );
  }
}
