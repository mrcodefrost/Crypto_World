import 'package:crypto_tracker/pages/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Crypto Tracker',
        theme: ThemeData(
          fontFamily: 'Comfortaa',
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
          scrollbarTheme: ScrollbarThemeData(
              thumbColor: MaterialStateProperty.all(Colors.white70)),
        ),
        home: const HomePage());
  }
}
