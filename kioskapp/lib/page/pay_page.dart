import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:kioskapp/page/first_page.dart';
import 'package:kioskapp/ordered_menu.dart';

class PayPage extends StatelessWidget {
  const PayPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    int sum = SumGet().SumG();
    double listHeight = 500;
    double menuWidth = screenSize.width*0.95;
    return ScreenUtilInit(
      designSize: Size(screenSize.width, screenSize.height),
      builder: () =>
          Scaffold(
              body: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(padding: EdgeInsets.only(bottom : 20.h),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.storefront, size: 60.sp,),
                        Text('키오스크 상호명', style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold),)
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      Text('주문 내역'),
                      Container(
                        decoration: BoxDecoration(
                          border: Border(
                              top: BorderSide(width: 3.0,),
                              bottom: BorderSide(width: 3.0,)),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                                width : menuWidth*0.60,
                                child: Text('제품명',style: TextStyle(fontSize: 20.sp), textAlign: TextAlign.center,)),
                            Container(
                                decoration: BoxDecoration(
                                  border: Border(
                                      left: BorderSide(width: 1.0,),
                                      right: BorderSide(width: 1.0,)),
                                ),
                                width : menuWidth*0.15,
                                child: Text('수량',style: TextStyle(fontSize: 20.sp), textAlign: TextAlign.center,)),
                            Container(
                                width : menuWidth*0.25,
                                child: Text('가격',style: TextStyle(fontSize: 20.sp), textAlign: TextAlign.center,)),
                          ],
                        ),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        color: Colors.grey,
                        height: listHeight.h,
                        child: ListView.builder(
                            padding: EdgeInsets.all(0),
                            itemCount: orders.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding: EdgeInsets.only(
                                    bottom: (listHeight/8/7).h),
                                child: Container(
                                  height: (listHeight/8).h,
                                  width: menuWidth,
                                  decoration: BoxDecoration(
                                    color: orders[index].isHot ? Colors.red : Colors.blue,
                                    borderRadius: BorderRadius.circular(15), //모서리를 둥글게
                                    border: Border.all(width: 2.w), //테두리
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                          width : menuWidth*0.60,
                                          child: Text(orders[index].title, textAlign: TextAlign.center,)),
                                      Container(
                                          height: (listHeight/8).h,
                                          width : menuWidth*0.15,
                                          decoration: BoxDecoration(
                                            border: Border(
                                                left: BorderSide(width: 1.0,),
                                                right: BorderSide(width: 1.0,)),
                                          ),
                                          child: Center(child: Text(orders[index].num.toString(), textAlign: TextAlign.center))),
                                      Container(
                                          width : menuWidth*0.25,
                                          child: Text(orders[index].price.toString()+'원', textAlign: TextAlign.center)),
                                    ],
                                  ),
                                ),
                              );
                            }
                        ),
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('총 금액 : '),
                            Text(sum.toString()+'원'),
                          ],
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      RaisedButton(child: Text('주문수정'),
                          onPressed: (){
                        Navigator.pop(context);
                          }),
                      RaisedButton(child: Text('결제하기'),
                          onPressed: (){
                        // menuList.countMenu = 0;
                        // ageGroup.selectedAgeGroup = 1;
                            orders.clear();
                            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    firstPage()), (route) => false);
                          }),
                    ],
                  )
                ],
              )
          ),
    );
  }
}

class SumGet{
  int sum = 0;
  SumG(){
    for(int i = 0; i < orders.length; i++)
      sum += (orders[i].price*orders[i].num);
    return sum;
  }
}