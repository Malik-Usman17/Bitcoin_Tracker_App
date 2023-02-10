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
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
         // elevation: 10.0,
            color: Colors.lightBlue,
            centerTitle: true,
            titleTextStyle: TextStyle(fontWeight: FontWeight.w700, fontSize: 25)
        )
      ),
      home: PriceScreen(),
      //home: PriceScreen,
      // home: ,
    );
  }
}
