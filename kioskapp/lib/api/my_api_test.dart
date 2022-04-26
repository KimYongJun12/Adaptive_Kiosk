
import 'package:flutter/material.dart';

import 'my_api.dart';

class myApiPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RaisedButton(onPressed: () {
            myApi(25,"MALE");
          },
            child: Text('?'),
          )
        ],
      ),


    );

  }
}
