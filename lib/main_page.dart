import 'package:flutter/material.dart';
import 'package:travancode_flutter_assignment/appBar/main_appbar.dart';
import 'package:travancode_flutter_assignment/screens/home_page.dart';
import 'package:travancode_flutter_assignment/favorite/favorites_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int selectedIndex = 0;
  void onTap(int index) {
    // print(index);
    setState(() {
      selectedIndex = index;
    });
  }

  final screens = const [
    HomePage(),
    FavoritesPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const MainAppBar(),
        body: screens[selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_rounded),
              label: 'HOME',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'FAVORITES',
            ),
          ],
          showUnselectedLabels: false,
          selectedItemColor: Colors.teal,
          unselectedItemColor: Colors.blueGrey[200],
          currentIndex: selectedIndex,
          onTap: onTap,
          selectedFontSize: 15.0,
        ),
      ),
    );
  }
}
