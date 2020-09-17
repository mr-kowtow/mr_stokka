import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  ReusableCard({@required this.colour, this.cardChild, this.onPress, this.borderRadius = 5.0, this.boxShadow});

  final Color colour;
  final Widget cardChild;
  final Function onPress;
  final double borderRadius;
  final List<BoxShadow> boxShadow;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: cardChild,
//        margin: EdgeInsets.all(15.0),
        margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        decoration: BoxDecoration(
            color: colour,
            borderRadius: BorderRadius.circular(borderRadius),
            boxShadow: boxShadow
        ),

      ),
    );
  }
}



