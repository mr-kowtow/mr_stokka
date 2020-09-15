import 'package:flutter/material.dart';
import 'constants.dart';
import 'home_page.dart';
void main() => runApp(StockManagement());

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