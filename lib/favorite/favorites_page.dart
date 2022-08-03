import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:travancode_flutter_assignment/data/api_data.dart';
import 'package:travancode_flutter_assignment/screens/coin_page.dart';
import 'package:travancode_flutter_assignment/widgets/create_card.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  @override
  Widget build(BuildContext context) {
    List<CoinAPIData> favorites = [];
    setState(() {
      favorites = favCoins.toSet().toList();
    });
    if (favorites.isEmpty) {
      return const SafeArea(
        child: Scaffold(
          body: Center(
            child: Text('No favorite coins.'),
          ),
        ),
      );
    } else {
      return SafeArea(
        child: Scaffold(
          body: ListView.builder(
            itemCount: favorites.length,
            itemBuilder: (context, index) {
              return CreateCard(
                name: favorites[index].name,
                symbol: favorites[index].symbol,
                logo: favorites[index].logo,
                price: favorites[index].price.toString(),
                marketCap: favorites[index].marketCap.toString(),
                priceChangePercentage24h:
                    favorites[index].priceChangePercentage24h.toString(),
                heart: favorites[index].heart,
              );
            },
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              setState(() {});
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
}
