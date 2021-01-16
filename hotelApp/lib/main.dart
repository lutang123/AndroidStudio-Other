import 'package:flutter/material.dart';
import 'package:hotelApp/screens/details_page.dart';
import 'package:hotelApp/screens/home_page.dart';
import 'package:hotelApp/screens/payment.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'HotelApp',
      themeMode: ThemeMode.dark,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Colors.orange,
        accentColor: Colors.white,
        primaryColorDark: Colors.black87,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
//      home: MyHomePage(title: 'iHotel'),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/details_page': (context) => Details(),
        '/payment': (context) => Payment(),
      },
    );
  }
}
