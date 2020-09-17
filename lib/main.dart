import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'utilities/constants.dart';
import 'screens/home_page.dart';

void main() async {
  await DotEnv().load('.env');
  runApp(StockManagement());
}

class StockManagement extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light().copyWith(
        primaryColor: kPrimaryColour,
        scaffoldBackgroundColor: kBackgroundColour
      ),
      home: HomePage(),
    );
  }
}