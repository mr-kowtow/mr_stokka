import 'package:flutter/material.dart';
import 'package:mr_stokka/roundedAppBar.dart';
import 'constants.dart';

class ItemPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light().copyWith(
          primaryColor: kPrimaryColour,
          scaffoldBackgroundColor: kBackgroundColour
      ),
      home: Scaffold(
        body: Stack(
          children: <Widget>[
            RoundedAppBar(),
            Positioned(
              top: 0.0,
              left: 0.0,
              right: 0.0,
              child: AppBar(
                leading: IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: (){Navigator.pop(context);},
                ),
                backgroundColor: Colors.transparent,
                elevation: 0,
              ),
            ),
            Column()
          ]
        )
      )
    );
  }
}

