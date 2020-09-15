import 'package:flutter/material.dart';
import 'constants.dart';

class ItemPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light().copyWith(
          primaryColor: kPrimaryColour,
          scaffoldBackgroundColor: kBackgroundColour
      ),
        home:
        Scaffold(
          appBar: AppBar(
            title: Text('Product'),
          ),
        ),
    );
  }
}

