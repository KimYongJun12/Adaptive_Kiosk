import 'package:flutter/material.dart';
import 'package:kioskapp/page/order_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kioskapp/singleTon.dart';

import 'camera_page.dart';

class firstPage extends StatefulWidget {

  firstPage({Key key}) : super(key: key);
  @override
  State<firstPage> createState() => _firstPageState();
}

class _firstPageState extends State<firstPage> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    var age = SingletonTwo();
    bool isInShop = true;
    List<String> ageGroup = ['대상 선택 안됨', '20대 남성', '60대 여성'];

    return ScreenUtilInit(
      designSize: Size(screenSize.width, screenSize.height),
      builder: () => Scaffold(
          body : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(padding: EdgeInsets.only(bottom : 20.h),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.storefront, size: 120.sp,),
                        Text('키오스크 상호명', style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),)
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(50.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        GestureDetector(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) => orderPage()));
                            },
                            child: Container(
                              height: 120.h,
                              width: 120.w,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15), //모서리를 둥글게
                                  border: Border.all(color: Colors.black38, width: 3.w)), //테두리
                              child: Column(mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[Icon(Icons.shopping_bag_outlined, size: 60.sp,),
                                  Text('포장', style: TextStyle(fontWeight: FontWeight.bold),)],),
                            )
                        ),
                        Padding(padding: EdgeInsets.all(20.0.sp)),
                        GestureDetector(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) => orderPage()));
                            },
                            child: Container(
                                height: 120,
                                width: 120,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15), //모서리를 둥글게
                                    border: Border.all(color: Colors.black38, width: 3.w)), //테두리
                                child: Column(mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[Icon(Icons.restaurant, size: 60.sp,),
                                    Text('매장', style: TextStyle(fontWeight: FontWeight.bold),)],)
                            )
                        ),

                      ],
                    ),
                  ),

                  RaisedButton(
                      child: Text('20대 남성'),
                      onPressed: () {
                        setState(() {
                          age.selectedAgeGroup = 1;
                        });
                      }),

                  RaisedButton(
                      child: Text('60대 여성'),
                      onPressed: () {
                        setState(() {
                          age.selectedAgeGroup = 2;
                        });
                      }),
                  RaisedButton(
                      child: Text('얼굴인식'),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => cameraPage()));
                      }),
                  Text('선택한 그룹 : '+ageGroup[age.selectedAgeGroup]),
                ],
              )
          )
      ),
    );
  }
}