import 'package:dart_airtable/dart_airtable.dart';
import 'package:flutter/material.dart';
import 'package:mr_stokka/data_hub.dart';
import 'package:mr_stokka/reusable_card.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> _brand = [];
  List<String> _item  = [];
  List<String> _price = [];
  int _counter=0;
  List<AirtableRecord> _records;


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
      appBar: AppBar(
        title: Text('Inventory'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(flex: 1,child: Text("data")),
          Expanded(
            flex: 5,
            child: ListView.builder(
              itemCount: _brand.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  height: 120,
                  color: Colors.yellow,
                  child: ReusableCard(
                    colour: Colors.red,
                    cardChild: Column(
                      children: <Widget>[
                        Text('${_brand[index]}'),
                        Text('${_item[index]}'),
                        Text('${_price[index]}'),
                      ],
                    ),
                  ),
                );
              }
            ),
          ),
        ],
      )
    );
  }
}