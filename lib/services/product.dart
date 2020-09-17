import 'package:flutter/cupertino.dart';


class Product{
  String brand;
  String item;
  String price;
  String image;

  Product({@required this.brand, @required this.item,@required this.price, this.image});

  String getBrand(){
    return brand;
  }

  String getItem(){
    return item;
  }

  String getPrice(){
    return price;
  }

  String getImage(){
    return image;
  }
}