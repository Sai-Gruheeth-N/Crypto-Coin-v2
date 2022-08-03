import 'package:flutter/material.dart';
import 'package:travancode_flutter_assignment/appBar/coinpage_appbar.dart';
import 'package:travancode_flutter_assignment/widgets/create_card.dart';
import 'package:travancode_flutter_assignment/data/api_data.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

const coinGeckoAPIurl =
    'https://api.coingecko.com/api/v3/coins/markets?vs_currency=inr&order=market_cap_desc&per_page=50&page=1&sparkline=false&price_change_percentage=24h';

List<CoinAPIData> coinData = [];

class _HomePageState extends State<HomePage> {
  Future<List<CoinAPIData>> getCoinData() async {
    http.Response response = await http.get(Uri.parse(coinGeckoAPIurl));
    if (response.statusCode == 200) {
      List<dynamic> values = [];
      values = json.decode(response.body);
      for (int index = 0; index < values.length; index++) {
        if (values[index] != null) {
          Map<String, dynamic> coin = values[index];
          coinData.add(CoinAPIData.fromJson(coin));
        }
      }
      setState(() {
        coinData;
      });
      return coinData;
    } else {
      throw Exception('Failed to load CoinAPIData');
    }
  }

  @override
  void initState() {
    getCoinData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: coinData.length,
          itemBuilder: (context, index) {
            return CreateCard(
              name: coinData[index].name,
              symbol: coinData[index].symbol,
              logo: coinData[index].logo,
              price: coinData[index].price.toString(),
              marketCap: coinData[index].marketCap.toString(),
              priceChangePercentage24h:
                  coinData[index].priceChangePercentage24h.toString(),
              heart: coinData[index].heart,
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              getCoinData();
            });
          },
          child: Icon(
            Icons.refresh,
            color: Colors.grey[850],
            size: 30.0,
          ),
        ),
      ),
    );
  }
}

// Future<List<CoinAPIData>> getCoinData() async {
//   List<CoinAPIData> coinList = [];
//   var url = coinGeckoAPIurl;
//   NetworkHelper networkHelper = NetworkHelper(url);
//   var coinData = await networkHelper.getData();
//   if (coinData.length > 0) {
//     for (int index = 0; index < coinData.length; index++) {
//       if (coinData[index] != null) {
//         Map<String, dynamic> coin = coinData[index];
//         coinList.add(CoinAPIData.fromJson(coin));
//       }
//     }
//     // print(coinList.first.name);
//     // print(coinList.last.name);
//     return coinList;
//   } else {
//     throw Exception('ERROR : Check getCoinData()');
//   }
// }

// FutureBuilder(
//         builder: (context, snapshot) {
//           return ListView.builder(
//             itemCount: 5,
//             itemBuilder: ((context, index) {
//               return CreateCard(
//                   name: 'Bitcoin',
//                   symbol: 'BTC',
//                   logo:
//                       'https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1547033579');
//             }),
//           );
//         },
//       ),