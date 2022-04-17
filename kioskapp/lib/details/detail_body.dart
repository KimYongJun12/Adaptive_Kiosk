import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kioskapp/details/cart_counter.dart';
import 'package:kioskapp/ordered_menu.dart';
import 'package:kioskapp/singleTon.dart';

import '../Product.dart';

class DetailBody extends StatelessWidget {
  Product product;
  var singleFour = Singleton();

  DetailBody({Product product}){
    this.product = product;
  }
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return ScreenUtilInit(
      designSize: Size(screenSize.width, screenSize.height),
      builder: () =>
          SingleChildScrollView(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 60.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5), //모서리를 둥글게
                          border: Border.all(color: Colors.black38, width: 3)),
                      child: Image(image: AssetImage(product.image)),
                    ),
                  ),
                  Text(product.title,style: TextStyle(fontSize: 30.sp),),
                  Padding(padding: EdgeInsets.all(10.sp)),
                  Text('가격 : '+product.price.toString()+'원',style: TextStyle(fontSize: 30.sp)),
                  Padding(padding: EdgeInsets.all(10.sp)),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('개수', style: TextStyle(fontSize: 30.sp),),
                        Padding(padding: EdgeInsets.symmetric(horizontal: 15.w)),
                        CartCounter(),
                      ]),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 40.h),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(
                              width: 120.w,
                              height: 60.h,
                              child: RaisedButton(child: Text('취소'),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  }),
                            ),
                            SizedBox(
                              width: 120.w,
                              height: 60.h,
                              child: RaisedButton(child: Text('확인'),
                                  onPressed: () {
                                    Navigator.pop(context);
                                    addToCart();
                                  }),
                            ),
                          ]
                      ),
                  ),
                ],
              ),
            ),
          ),
    );

  }

  void addToCart() {
    bool isInCart = false;
    for(int i = 0; i < orders.length; i++){
      if(product.title.contains(orders[i].title)){
        orders[i].num += singleFour.countMenu;
        isInCart = true;
      }
    }
    if(!isInCart){
      Order order = Order(
        title: product.title,
        price: product.price,
        num: singleFour.countMenu,
        isHot: product.isHot);
    orders.add(order);
    }
  }
}

