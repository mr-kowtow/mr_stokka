import 'package:flutter/material.dart';
import 'package:mr_stokka/reusable_card.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> entries = <String>['A', 'B', 'C','A', 'B', 'C','A', 'B', 'C'];
  final List<int> colorCodes = <int>[600, 500, 100,600, 500, 100, 500, 100,600];

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
              itemCount: entries.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  height: 120,
                  color: Colors.yellow,
                  child: ReusableCard(
                    colour: Colors.red, cardChild: Text('Entry ${entries[index]}'),),
                );
              }
            ),
          ),
        ],
      )
    );
  }
}