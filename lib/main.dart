import 'package:bitcoin_tracker/screens/price_screen.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(useMaterial3: true).copyWith(
        primaryColor: Colors.lightBlue,
        scaffoldBackgroundColor: Colors.white
      ),
      home: PriceScreen(),
      //home: PriceScreen,
      // home: ,
    );
  }
}
