import 'package:bitcoin_tracker/services/constants.dart';
import 'package:bitcoin_tracker/services/networking.dart';

const url = 'https://rest.coinapi.io/v1/exchangerate/BTC/';

class CoinData{

  // const url = 'https://rest.coinapi.io/v1/exchangerate/BTC/';

  Future<dynamic> getCoinData(String? currencyName) async{
    String priceUrl = '$url$currencyName?apikey=$apiKey';
    Networking network = Networking(priceUrl);
    var priceData = await network.getPriceData();
    return priceData;
  }

}