import 'package:flutter/material.dart';
import 'package:travancode_flutter_assignment/widgets/create_card.dart';
import 'package:travancode_flutter_assignment/data/networking.dart';
import 'package:travancode_flutter_assignment/data/api_data.dart';

class CoinPage extends StatefulWidget {
  late Color? heart;
  final String name;
  final String symbol;
  final String logo;
  final String price;
  final String marketCap;
  final String priceChangePercentage24h;
  CoinPage({
    super.key,
    required this.heart,
    required this.name,
    required this.symbol,
    required this.logo,
    required this.price,
    required this.marketCap,
    required this.priceChangePercentage24h,
  });

  @override
  State<CoinPage> createState() => _CoinPageState();
}

class _CoinPageState extends State<CoinPage> {
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

  Color? getColor(String value) {
    if (double.parse(value) < 0) {
      return Colors.red;
    }
    return Colors.green;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 1.0,
          shadowColor: Colors.grey[500],
          centerTitle: true,
          title: const Text(
            'CryptoCoin',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          leading: Padding(
            padding: const EdgeInsets.all(5.0),
            child: IconButton(
              onPressed: () {
                Navigator.pop(context, widget.heart);
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.teal,
                size: 30,
              ),
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: IconButton(
                icon: Icon(
                  Icons.favorite,
                  color: widget.heart,
                ),
                onPressed: () {
                  setState(
                    () {
                      if (widget.heart == Colors.white) {
                        widget.heart = Colors.redAccent[400];
                        addFav();
                      } else {
                        widget.heart = Colors.white;
                        removeFav();
                      }
                    },
                  );
                },
              ),
            ),
          ],
        ),
        body: Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: SizedBox(
                      height: 120.0,
                      child: Image.network(
                        widget.logo,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          widget.name,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              fontSize: 44.0, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          widget.symbol.toUpperCase(),
                          style: const TextStyle(
                              fontSize: 24.0, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Divider(
              color: Colors.black,
              thickness: 2.0,
              indent: 5.0,
              endIndent: 5.0,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Center(
                        child: Text(
                          'Price  :  Rs ${widget.price}',
                          style: TextStyle(fontSize: 25.0),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Center(
                        child: Text(
                          'MarketCap  :  ${widget.marketCap}',
                          style: TextStyle(fontSize: 25.0),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Text(
                              '% Change (24hr)  :  ',
                              style: TextStyle(fontSize: 25.0),
                            ),
                            Text(
                              ' ${widget.priceChangePercentage24h}%',
                              style: TextStyle(
                                fontSize: 25.0,
                                color:
                                    getColor(widget.priceChangePercentage24h),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
