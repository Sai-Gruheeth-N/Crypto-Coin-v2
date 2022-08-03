import 'package:flutter/material.dart';
import 'package:travancode_flutter_assignment/data/api_data.dart';
import 'package:travancode_flutter_assignment/screens/home_page.dart';

class Get {
  CoinAPIData getObject(String symbol) {
    for (int i = 0; i < coinData.length; i++) {
      if (symbol == coinData[i].symbol) {
        return coinData[i];
      }
    }
    throw Exception('No data');
  }
}



// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'package:travancode_flutter_assignment/data/api_data.dart';

// const coinGeckoAPIurl =
//     'https://api.coingecko.com/api/v3/coins/markets?vs_currency=inr&order=market_cap_desc&per_page=25&page=1&sparkline=false&price_change_percentage=24h';
// // const apiKey = 'e3db5fdb-52cd-4d8c-8db5-d38e4ba06df2';

// class NetworkHelper {
//   NetworkHelper(this.url);
//   final String url;

//   Future getData() async {
//     http.Response response = await http.get(Uri.parse(url));
//     print(response.statusCode);
//     if (response.statusCode == 200) {
//       String data = response.body;
//       return jsonDecode(data);
//     } else {
//       throw ('Check Networking GET request');
//     }
//   }
// }