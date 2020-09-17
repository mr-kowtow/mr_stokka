import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mr_stokka/services/product.dart';
import '../services/data_hub.dart';
import '../components/reusable_card.dart';
import '../screens/item_page.dart';
import '../components/rounded_app_bar.dart';
import '../components/search_bar.dart';
import '../utilities/constants.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Product> products = [];
  List<String> uniqueBrands = [];
  List<Product> tmp_products = [];
  List<String> tmp_uniqueBrands = [];

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
        products = dataHub.getProductList();
        uniqueBrands = dataHub.getUniqueBrandList();
        tmp_products = products;
        tmp_uniqueBrands = uniqueBrands;
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
                                      Text("${tmp_products.length}",
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
                          brands: uniqueBrands,
                            inputChange: (String val){
                              List<Product>inputChangeProducts = [];
                              if(val == ""){
                                inputChangeProducts = products;
                              } else {
                                for (var i = 0; i < products.length; i++) {
                                  if (products[i].getItem().toLowerCase().contains(val) || products[i].getBrand().toLowerCase().contains(val)) {
                                    inputChangeProducts.add(products[i]);
                                  }
                                }
                              }
                              setState(() {
                                tmp_products = inputChangeProducts;
                              });
                            },
                          //todo: create product class to remove this garbage code
                          onChange: (String val){
                            List<Product>onChangeProducts = [];
                            for(var i=0;i<products.length;i++){
                              if(val == "All"){
                                onChangeProducts = products;
                              }
                              else if(products[i].getBrand() == val){
                                onChangeProducts.add(products[i]);
                              }
                            }
                            setState(() {
                              tmp_products = onChangeProducts;
                            });
                          },
                        ),
                      ],
                    )
                ),
                Expanded(
                  flex: 5,
                  child: ListView.builder(
                      itemCount: tmp_products.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          height: 100,
                          color: kBackgroundColour,
                          child: ReusableCard(
                            onPress: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ItemPage(product: products[index],)
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
                                      Text('${tmp_products[index].getBrand()}',
                                        style: kRegularTextStyle,),
                                      Text('${tmp_products[index].getItem()}',
                                        overflow: TextOverflow.ellipsis,
                                        style: kTitleTextStyle,),
                                      Text('\$${tmp_products[index].getPrice()}',
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


















