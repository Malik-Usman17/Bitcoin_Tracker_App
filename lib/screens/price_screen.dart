import 'package:bitcoin_tracker/coins.dart';
import 'package:bitcoin_tracker/services/coin_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;
import 'package:http/http.dart' as http;

class PriceScreen extends StatefulWidget {
  const PriceScreen({Key? key}) : super(key: key);

  @override
  State<PriceScreen> createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  CoinData coinData = CoinData();
  String? selectedCurrency = 'USD';
  String? coinPrice;

  // Future<dynamic> getPrice(String? currencyName) async {
  //   http.Response res = await http.get(Uri.parse('$url$currencyName?apikey=$apiKey'));
  //   if(res.statusCode == 200){
  //     String data = res.body;
  //     print("RESPONSE: ${jsonDecode(data)}");
  //     return jsonDecode(data);
  //   }
  //   else{
  //     print(res);
  //   }
  // }

  CupertinoPicker iosPicker() {
    List<Text> pickerItems = [];
    for(String currency in currenciesList){
      pickerItems.add(Text(currency));
    }
    return CupertinoPicker(
      itemExtent: 32.0,
      onSelectedItemChanged: (selectedIndex) {
        print(selectedIndex);
      },
      children: pickerItems,
    );
  }

  DropdownButton<String> getDropDownButton() {
    List<DropdownMenuItem<String>> dropdownItems = [];
    for(String currency in currenciesList){
      var newItem = DropdownMenuItem(
        value: currency,
        child: Text(currency),
      );
      dropdownItems.add(newItem);
    }
    return DropdownButton<String>(
        isExpanded: true,
        menuMaxHeight: 200,
        value: selectedCurrency,
        items: dropdownItems,
        onChanged: (val) async{
          setState(() {
            //print("DATA: ${data.runtimeType}");
            selectedCurrency = val;
          });
          var pricing = await coinData.getCoinData(selectedCurrency);
          print("PRICING: $pricing");
          setState(() {
            coinPrice = pricing['rate'].toStringAsFixed(3);
          });
        }
    );
  }

  List<Widget> getPickerItem () {
    List<Text> pickerItems = [];
    for(String currency in currenciesList){
      pickerItems.add(Text(currency));
    }
    return pickerItems;
  }

  Widget getPickerPlatformSpecific() {
    if(Platform.isIOS){
      return iosPicker();
    }
    else {
      return getDropDownButton();
    }
    // else{
    //   return;
    // }
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
            padding: const EdgeInsets.fromLTRB(18, 18, 18, 0),
            child: Card(
              color: Colors.lightBlueAccent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: Text(
                  '1 BTC = $coinPrice $selectedCurrency',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
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
            child: Platform.isIOS ? iosPicker() : getDropDownButton(),
          )
        ],
      ),
    );
  }
}
