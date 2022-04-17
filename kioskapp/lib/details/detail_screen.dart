import 'package:flutter/material.dart';
import 'package:kioskapp/details/detail_body.dart';
import 'package:kioskapp/singleTon.dart';
import 'cart_counter.dart';
import '../Product.dart';

class DetailScreen extends StatelessWidget {
  final Product product;
  var singleThree = Singleton();

  DetailScreen({Key key, this.product}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ),
      body: DetailBody(product: product)

    );
  }
}
