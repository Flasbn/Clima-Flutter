import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/home.dart';
import 'package:flutter_application_1/theme/dark_theme.dart';
import 'package:flutter_application_1/theme/light_theme.dart';

void main() {
  runApp(const UniClima());
}

class UniClima extends StatelessWidget {
  const UniClima({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const Home(),
      title: "UniClima",
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      darkTheme: darkTheme(),
      theme: lightTheme(),
    );
  }
}
