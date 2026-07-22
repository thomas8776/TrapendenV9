import 'package:flutter/material.dart';
import 'services/account_service.dart';
import 'pages/home_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await AccountService.loadAccounts();

  runApp(const TrapendenV9());
}

class TrapendenV9 extends StatelessWidget {
  const TrapendenV9({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TrapendenV10',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xff090d18),
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.cyanAccent,
          brightness: Brightness.dark,
        ),
      ),
      home: const HomePage(),
    );
  }
}
