import 'package:flutter/material.dart';

const kTitleTextStyle = TextStyle(
  fontSize: 15.0,
  fontWeight: FontWeight.bold,
);

const kRegularTextStyle = TextStyle(
  fontSize: 15.0,
);

const kGreyedTextStyle = TextStyle(
  fontSize: 13.0,
  color: Colors.blueGrey
);

const kPrimaryColour = Color(0xFF2E62EB);
const kBackgroundColour = Color(0xFFF7F7F7);

const kAppBarColor = Colors.orange;

//TODO: this shouldnt be here, not a const
var kBoxShadow = [BoxShadow(
  color: Colors.grey.withOpacity(0.4),
  spreadRadius: 5,
  offset: Offset(0, 3),
  blurRadius: 7, // changes position of shadow
)];