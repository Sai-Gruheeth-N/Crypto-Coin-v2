import 'package:flutter/material.dart';

class CoinAPIData {
  CoinAPIData({
    required this.name,
    required this.symbol,
    required this.logo,
    required this.price,
    required this.marketCap,
    required this.priceChangePercentage24h,
    required this.heart,
  });
  final String name;
  final String symbol;
  final String logo;
  final num price;
  final num marketCap;
  final double priceChangePercentage24h;
  Color? heart;

  factory CoinAPIData.fromJson(Map<String, dynamic> json) {
    return CoinAPIData(
      name: json['name'],
      symbol: json['symbol'],
      logo: json['image'],
      price: json['current_price'],
      marketCap: json['market_cap'],
      priceChangePercentage24h: json['price_change_percentage_24h'],
      heart: Colors.white,
    );
  }
}
