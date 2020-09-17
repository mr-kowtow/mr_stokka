import 'package:flutter/material.dart';
import '../components/reusable_card.dart';
import '../utilities/constants.dart';

class SearchBar extends StatefulWidget {
  List<String> brands;
  final Function(String) onChange;
  final Function(String) inputChange;

  SearchBar({this.brands, this.onChange, this.inputChange});

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  String selectedBrand = "All";


  List<DropdownMenuItem<String>> buildDropdownMenuItems(List brands){
    List<DropdownMenuItem<String>> items = List();
    items.add(DropdownMenuItem(value: "All", child: Text("All"),));
    for (String brand in brands){
      items.add(DropdownMenuItem(value: brand, child: Text(brand),));
    }
    return items;
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      child: ReusableCard(
        colour: Colors.white,
        borderRadius: 10.0,
        boxShadow: kBoxShadow,
        cardChild: Row(
          children: <Widget>[
            Expanded(
              flex:1,
              child: Container(
                margin: EdgeInsets.only(left: 20),
                child: TextFormField(
                  onChanged: (txt){
                    setState(() {
                       widget.inputChange(txt.toLowerCase());
                    });
                  },
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Search ...'
                  ),
                ),
              ),
            ),
            Expanded(
                flex: 1,
                child: DropdownButton(
                  items: buildDropdownMenuItems(widget.brands),
                  onChanged: (String value){
                    setState(() {
                      selectedBrand = value;
                      widget.onChange(value);
                    });
                  },
                  value: selectedBrand,
                ),
            ),
          ],
        ),
      ),
    );
  }
}
