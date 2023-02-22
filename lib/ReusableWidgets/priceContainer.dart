import 'package:flutter/material.dart';


class PriceContainer extends StatelessWidget {
  const PriceContainer({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(18, 18, 18, 0),
      child: Card(
        color: Colors.lightBlueAccent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontSize: 20.0,
                color: Colors.white
            ),
          ),
        ),
      ),
    );
  }
}
