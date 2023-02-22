import 'package:bitcoin_tracker/services/constants.dart';
import 'package:bitcoin_tracker/services/networking.dart';

//const url = 'https://rest.coinapi.io/v1/exchangerate/BTC/';
const url = 'https://rest.coinapi.io/v1/exchangerate';

class CoinData{

  // const url = 'https://rest.coinapi.io/v1/exchangerate/BTC/';

  Future<dynamic> getCoinData(String? currencyName, String? coinType) async{
    String priceUrl = '$url/$coinType/$currencyName?apikey=$apiKey';
    Networking network = Networking(priceUrl);
    var priceData = await network.getPriceData();
    return priceData;
  }

}