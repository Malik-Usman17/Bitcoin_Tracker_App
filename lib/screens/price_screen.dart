import 'package:bitcoin_tracker/ReusableWidgets/priceContainer.dart';
import 'package:bitcoin_tracker/coins.dart';
import 'package:bitcoin_tracker/services/coin_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;


class PriceScreen extends StatefulWidget {
  const PriceScreen({Key? key}) : super(key: key);

  @override
  State<PriceScreen> createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {

  CoinData coinData = CoinData();
  String? selectedCurrency = 'USD';
  String? coinPrice = '?';
  String? eth = '?';
  String? ltc = '?';

  CupertinoPicker iosPicker() {
    List<Text> pickerItems = [];
    for(String currency in currenciesList){
      pickerItems.add(Text(currency));
    }
    return CupertinoPicker(
      itemExtent: 32.0,
      onSelectedItemChanged: (selectedIndex) {
        //print(selectedIndex);
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
          var pricing = await coinData.getCoinData(selectedCurrency, 'BTC');
          var ethPrice = await coinData.getCoinData(selectedCurrency, 'ETH');
          var ltcPrice = await coinData.getCoinData(selectedCurrency, 'LTC');
          setState(() {
            coinPrice = pricing['rate'].toStringAsFixed(3);
            eth = ethPrice['rate'].toStringAsFixed(3);
            ltc = ltcPrice['rate'].toStringAsFixed(3);
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
          PriceContainer(title: '1 BTC = $coinPrice $selectedCurrency'),
          PriceContainer(title: '1 ETH = $eth $selectedCurrency'),
          PriceContainer(title: '1 ${cryptoList[2]} = $ltc $selectedCurrency'),
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
