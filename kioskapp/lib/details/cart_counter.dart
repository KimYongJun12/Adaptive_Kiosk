import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../singleTon.dart';
import 'detail_body.dart';

class CartCounter extends StatefulWidget {
  @override
  _CartCounterState createState() => _CartCounterState();
}

class _CartCounterState extends State<CartCounter> {
  int numOfItems = 1;
  var singleTwo = Singleton();
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    singleTwo.countMenu = numOfItems;
    return ScreenUtilInit(
      designSize: Size(screenSize.width, screenSize.height),
      builder: () =>
          Row(
            children: <Widget>[
              buildOutlineButton(
                icon: Icons.remove,
                press: () {
                  if (numOfItems > 1) {
                    setState(() {
                      numOfItems--;
                    });
                  }
                },
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Text(
                  // if our item is less  then 10 then  it shows 01 02 like that
                  numOfItems.toString().padLeft(2, "0"),
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
              buildOutlineButton(
                  icon: Icons.add,
                  press: () {
                    setState(() {
                      numOfItems++;
                    });
                  }),
            ],
          ),
    );
  }

  SizedBox buildOutlineButton({IconData icon, Function press}) {
    return SizedBox(
      width: 50.w,
      height: 40.h,
      child: OutlineButton(
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        onPressed: press,
        child: Icon(icon),
      ),
    );
  }
}

// class NNum{
//   int num;
//   void GetNum(int n) {
//     num = n;
//   }
//   GiveNum(){
//     return num;
//   }
// }

