import 'package:flutter/material.dart';
import 'package:kioskapp/singleTon.dart';

import 'package:kioskapp/page/first_page.dart';


void main() => runApp(myApp());
class myApp extends StatelessWidget {
  var singleOne = Singleton();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title : '제목입니다dd',
        // home: myHomepage('제목입니다123'),
        home: firstPage()

    );
  }
}