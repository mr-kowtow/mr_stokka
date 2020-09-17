import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mr_stokka/data_hub.dart';
import 'package:mr_stokka/reusable_card.dart';
import 'package:mr_stokka/itemPage.dart';
import 'package:mr_stokka/roundedAppBar.dart';
import 'package:mr_stokka/searchBar.dart';
import 'constants.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> brand = [];
  List<String> item = [];
  List<String> price = [];
  List<String> image = [];
  List<String> tmp_brand=[];
  List<String> tmp_item=[];
  List<String> tmp_price=[];
  List<String> tmp_image=[];

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
        brand = dataHub.getBrandList();
        item = dataHub.getItemList();
        price = dataHub.getPriceList();
        image = dataHub.getImageList();
        tmp_brand = brand;
        tmp_item = item;
        tmp_price = price;
        tmp_image = image;
        print(tmp_brand);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
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
                                    Text("${tmp_brand.length}",
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
                        SearchBar(
                          brands: brand,
                          //todo: create product class to remove this garbage code
                          onChange: (String val){
                            List<String>onChangeBrand = [];
                            List<String>onChangeItem = [];
                            List<String>onChangePrice = [];
                            List<String>onChangeImage = [];
                            for(var i=0;i<brand.length;i++){
                              if(val == "All"){
                                onChangeBrand = brand;
                                onChangeItem = item;
                                onChangePrice = price;
                                onChangeImage = image;
                              }
                              else if(brand[i] == val){
                                onChangeBrand.add(brand[i]);
                                onChangeItem.add(item[i]);
                                onChangePrice.add(price[i]);
                                onChangeImage.add(image[i]);
                              }
                            }
                            setState(() {
                              tmp_brand = onChangeBrand;
                              tmp_item = onChangeItem;
                              tmp_price = onChangePrice;
                              tmp_image = onChangeImage;
                            });
                          },
                        ),
                      ],
                    )
                ),
                Expanded(
                  flex: 5,
                  child: ListView.builder(
                      itemCount: tmp_brand.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          height: 100,
                          color: kBackgroundColour,
                          child: ReusableCard(
                            onPress: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ItemPage(brand: tmp_brand[index],item: tmp_item[index], price: tmp_price[index],image: tmp_image[index])
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
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text('${tmp_brand[index]}',
                                        style: kRegularTextStyle,),
                                      Text('${tmp_item[index]}',
                                        overflow: TextOverflow.ellipsis,
                                        style: kTitleTextStyle,),
                                      Text('\$${tmp_price[index]}',
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
            ),
          ],
        ));
  }

}


















