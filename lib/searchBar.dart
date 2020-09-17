import 'package:flutter/material.dart';
import 'package:mr_stokka/reusable_card.dart';
import 'home_page.dart';
import 'constants.dart';

class SearchBar extends StatefulWidget {
  String input="";
  List<String> brands;
  final Function(String) onChange;

  SearchBar({this.brands, this.onChange,});

  String getInput(){
    return input;
  }

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  String selectedBrand;


  List<DropdownMenuItem<String>> buildDropdownMenuItems(List brands){
    List<DropdownMenuItem<String>> items = List();
    items.add(DropdownMenuItem(value: "All", child: Text("All"),));
    for (String brand in brands.toSet().toList()){
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
                  onFieldSubmitted: (txt){
                    setState(() {
                       widget.input = txt;
                       print(widget.input);
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
