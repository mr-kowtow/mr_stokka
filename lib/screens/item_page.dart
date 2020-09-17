import 'package:flutter/material.dart';
import 'package:mr_stokka/services/product.dart';
import '../components/rounded_app_bar.dart';
import '../utilities/constants.dart';

class ItemPage extends StatelessWidget {

  Product product;
  ItemPage({this.product});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light().copyWith(
          primaryColor: kPrimaryColour,
          scaffoldBackgroundColor: kBackgroundColour
      ),
      home: Scaffold(
        resizeToAvoidBottomInset: false,
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
                  child: Image(image: NetworkImage(product.getImage()??"https://static.thenounproject.com/png/340719-200.png")),
                ),
                Expanded(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("${product.getBrand()}", style: kTitleTextStyle,),
                      Text("${product.getItem()}", style: kRegularTextStyle,),
                      Text("${product.getPrice()}", style: kRegularTextStyle,),
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

