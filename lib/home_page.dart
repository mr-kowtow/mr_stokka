import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mr_stokka/data_hub.dart';
import 'package:mr_stokka/reusable_card.dart';
import 'package:mr_stokka/itemPage.dart';
import 'package:mr_stokka/roundedAppBar.dart';

import 'constants.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> _brand = [];
  List<String> _item = [];
  List<String> _price = [];

  @override
  void initState() {
    super.initState();
    getRecords();
  }

  void getRecords() async {
    DataHub dataHub = DataHub();
    await dataHub.getRecords().then((value) {
      dataHub.setData(value);
      setState(() {
        _brand = dataHub.getBrandList();
        _item = dataHub.getItemList();
        _price = dataHub.getPriceList();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: <Widget>[
            RoundedAppBar(),
            Column(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Text("asd"),
                ),
                Expanded(
                    flex: 3,
                    child: Column(
                      children: <Widget>[
                        Container(
                          height: 90,
                          child: ReusableCard(
                            colour: Colors.white,
                            borderRadius: 10.0,
                            boxShadow: kBoxShadow,
                            cardChild: Row(
                              children: <Widget>[
                                Expanded(child:
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text("${_brand.length}",
                                      style: kTitleTextStyle,),
                                    SizedBox(height: 5.0,),
                                    Text("In Stock", style: kGreyedTextStyle,),
                                  ],
                                ),
                                ),
                                Expanded(child:
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text("66", style: kTitleTextStyle,),
                                    SizedBox(height: 5.0,),
                                    Text("Sold", style: kGreyedTextStyle,),
                                  ],
                                ),
                                ),
                                Expanded(child:
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text("77", style: kTitleTextStyle,),
                                    SizedBox(height: 5.0,),
                                    Text("Shipped", style: kGreyedTextStyle,),
                                  ],
                                ),
                                ),
                                Expanded(child:
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text("99", style: kTitleTextStyle,),
                                    SizedBox(height: 5.0,),
                                    Text("In-transit", style: kGreyedTextStyle,),
                                  ],
                                ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    )
                ),
                Expanded(
                  flex: 5,
                  child: ListView.builder(
                      itemCount: _brand.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          height: 100,
                          color: kBackgroundColour,
                          child: ReusableCard(
                            onPress: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ItemPage()
                                  )
                              );
                            },
                            colour: Colors.white,
                            cardChild: Row(
                              children: <Widget>[
                                Container(
                                  color: Colors.green,
                                  width: 4,
                                  margin: EdgeInsets.only(right: 10),
                                ),
                                Flexible(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment
                                        .start,
                                    children: <Widget>[
                                      Text('${_brand[index]}',
                                        style: kRegularTextStyle,),
                                      Text('${_item[index]}',
                                        overflow: TextOverflow.ellipsis,
                                        style: kTitleTextStyle,),
                                      Text('\$${_price[index]}',
                                        style: kRegularTextStyle,),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }
                  ),
                ),
              ],
            )
          ],
        ));
  }

}


















