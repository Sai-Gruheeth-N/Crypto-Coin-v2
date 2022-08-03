import 'package:flutter/material.dart';
import 'package:travancode_flutter_assignment/main_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Color.fromARGB(255, 39, 39, 39),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.grey[900],
          shadowColor: Colors.white70,
        ),
      ),
      home: const MainPage(),
    );
  }
}
