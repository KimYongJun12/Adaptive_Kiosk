import 'package:flutter/material.dart';
import 'package:kioskapp/singleTon.dart';

import 'first_page.dart';


void main() => runApp(myApp());
class myApp extends StatelessWidget {
  var singleOne = Singleton();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title : '제목입니다',
        // home: myHomepage('제목입니다123'),
        home: firstPage()

    );
  }
}