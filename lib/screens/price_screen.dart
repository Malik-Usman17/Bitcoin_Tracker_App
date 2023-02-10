import 'package:bitcoin_tracker/coins.dart';
import 'package:flutter/material.dart';

class PriceScreen extends StatefulWidget {
  const PriceScreen({Key? key}) : super(key: key);

  @override
  State<PriceScreen> createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {

  String? selectedCurrency = 'USD';

  // List<DropdownMenuItem> getDropDownItems() {
  //   List<DropdownMenuItem<String>> dropdownItems = [];
  //
  //   for(int i=0; i<currenciesList.length; i++){
  //     String currency = currenciesList[i];
  //     var newItem = DropdownMenuItem(
  //         child: Text(currency),
  //         value: currency,
  //     );
  //     dropdownItems.add(newItem);
  //   }
  //
  //   return dropdownItems;
  // }

  List<DropdownMenuItem> getDropDownItems() {
    List<DropdownMenuItem<String>> dropdownItems = [];

    for(String currency in currenciesList){
      var newItem = DropdownMenuItem(
        child: Text(currency),
        value: currency,
      );
      dropdownItems.add(newItem);
    }

    return dropdownItems;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Coin Tracker'),
        //elevation: 10.0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(18, 18, 18, 0),
            child: Card(
              color: Colors.lightBlueAccent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: Text(
                  '1 BTC = ? USD',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 150,
            alignment: Alignment.center,
            padding: const EdgeInsets.only(bottom: 30.0, left: 30, right: 30),
            color: Colors.lightBlue,
            child: DropdownButton(
              isExpanded: true,
              iconSize: 35,
              borderRadius: BorderRadius.circular(10),
              menuMaxHeight: 200,
              value: selectedCurrency,
              items: getDropDownItems(),
            //   items: [
            //   DropdownMenuItem(
            //     child: Text('GBP'),
            //     value: 'GBP',
            //   ),
            //     DropdownMenuItem(
            //       child: Text('EUR'),
            //       value: 'EUR',
            //     ),
            //     DropdownMenuItem(
            //       child: Text('USD'),
            //       value: 'USD',
            //     ),
            // ],
              onChanged: (val) {
                setState(() {
                  selectedCurrency = val;
                });
              // selectedCurrency = val;
            },
            ),
          )
        ],
      ),
    );
  }
}
