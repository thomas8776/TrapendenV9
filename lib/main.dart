import 'package:flutter/material.dart';
import 'pages/home_page.dart';

void main() {
  runApp(const TrapendenV9());
}

class TrapendenV9 extends StatelessWidget {
  const TrapendenV9({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TrapendenV9',
      theme: ThemeData.dark(),
      home: const HomePage(),
    );
  }
}
