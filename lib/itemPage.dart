import 'package:flutter/material.dart';
import 'package:mr_stokka/roundedAppBar.dart';
import 'constants.dart';

class ItemPage extends StatelessWidget {
  String brand;
  String item;
  String price;
  String image;

  ItemPage({this.brand, this.item, this.price, this.image});

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
            Column(
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: Text(""),
                ),
                Expanded(
                  flex: 1,
                  child: Image(image: NetworkImage(image??"https://static.thenounproject.com/png/340719-200.png")),
                ),
                Expanded(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("$brand", style: kTitleTextStyle,),
                      Text("$item", style: kRegularTextStyle,),
                      Text("$price", style: kRegularTextStyle,),
                    ],
                  )
                )
                ]
            )
          ]
        )
      )
    );
  }
}

