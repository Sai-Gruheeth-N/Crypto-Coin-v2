import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:travancode_flutter_assignment/data/api_data.dart';
import 'package:travancode_flutter_assignment/data/networking.dart';
import 'package:travancode_flutter_assignment/screens/coin_page.dart';

class CreateCard extends StatefulWidget {
  CreateCard({
    super.key,
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
  final String price;
  final String marketCap;
  final String priceChangePercentage24h;
  late Color? heart;

  @override
  State<CreateCard> createState() => _CreateCardState();
}

List<CoinAPIData> favCoins = [];

class _CreateCardState extends State<CreateCard> {
  void addFav() {
    CoinAPIData tempo = Get().getObject(widget.symbol);
    if (!favCoins.contains(tempo)) {
      favCoins.add(tempo);
    }
    tempo.heart = Colors.redAccent[400];
  }

  void removeFav() {
    CoinAPIData temp = Get().getObject(widget.symbol);
    if (favCoins.contains(temp)) {
      favCoins.remove(temp);
    }
    temp.heart = Colors.white;
  }

  _getColorResult(BuildContext context) async {
    Color? result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return CoinPage(
            heart: widget.heart,
            name: widget.name,
            symbol: widget.symbol,
            logo: widget.logo,
            price: widget.price,
            marketCap: widget.marketCap,
            priceChangePercentage24h: widget.priceChangePercentage24h,
          );
        },
      ),
    );
    setState(() {
      widget.heart = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _getColorResult(context);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 3.0, vertical: 2.0),
        child: Card(
          elevation: 3.0,
          shadowColor: Colors.grey[500],
          child: SizedBox(
            height: 80.0,
            width: double.infinity,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Image.network(
                    widget.logo,
                    height: 60.0,
                    width: 60.0,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.name,
                        style: const TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 3.0,
                      ),
                      Text(
                        widget.symbol.toUpperCase(),
                        style: const TextStyle(
                            fontSize: 14.0, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      IconButton(
                        onPressed: () {
                          setState(
                            () {
                              if (widget.heart == Colors.white) {
                                setState(
                                  () {
                                    widget.heart = Colors.redAccent[400];
                                    addFav();
                                  },
                                );
                              } else {
                                setState(
                                  () {
                                    widget.heart = Colors.white;
                                    removeFav();
                                  },
                                );
                              }
                            },
                          );
                        },
                        icon: Icon(
                          Icons.favorite,
                          color: widget.heart,
                        ),
                        alignment: Alignment.centerRight,
                      ),
                      Text(
                        'Rs.${widget.price}',
                        style: const TextStyle(fontSize: 22.0),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
