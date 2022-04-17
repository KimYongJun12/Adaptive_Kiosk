import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kioskapp/singleTon.dart';
import 'Product.dart';
import 'details/detail_screen.dart';
import 'item_card.dart';
import 'pay_page.dart';

class orderPage extends StatefulWidget {

  @override
  State<orderPage> createState() => _orderPageState();
}

class _orderPageState extends State<orderPage> {
  @override
  bool isPressed = true;
  var ageGroup = SingletonTwo();
  List pr;
  List<String> categories = ["커피", "에이드""\n&주스", "차", "음료", "스무디"];
  // By default our first item will be selected
  int selectedIndex = 0;
  int presentIndex = 0;
  int numOfItems, numOfRows;
  final int numOfcategories = 4;

  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: buildAppBar(),
      body : ScreenUtilInit(
        designSize: Size(screenSize.width, screenSize.height),
        builder: () =>
            Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  buildCategories(),
                  Expanded(
                      child: Padding(
                        padding: EdgeInsets.all(8.0.sp),
                        child: Container(
                          child: buildGridView(),
                        ),
                      )
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 5.h),
                    child: Center(
                      child: ButtonTheme(
                        minWidth: 140.w,
                        buttonColor: Colors.white54,
                        child: RaisedButton(
                          child: Column(
                            children: [
                              isPressed ? Icon(Icons.arrow_downward_rounded,size: 50.sp, color: Colors.black,) : Icon(Icons.arrow_upward_rounded,size: 50.sp, color: Colors.black,),
                              isPressed ? Text('더 많은 메뉴',style: TextStyle(fontSize: 20.sp, color: Colors.black)) : Text('처음 메뉴',style: TextStyle(fontSize: 20.sp, color: Colors.black)),
                            ],
                          ),
                          onPressed: (){
                            setState(() {
                              isPressed = !isPressed;
                            });
                          },
                        ),
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        RaisedButton(child: Text('결제하기', style: TextStyle(fontSize: 20.sp),),
                            onPressed: (){
                              Navigator.push( context, MaterialPageRoute(builder: (context) => PayPage()),);
                            }
                        )
                      ],
                    ),
                  ),
                ]
            ),
      ),
    );
  }

  Row buildCategories() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ButtonTheme(
          minWidth: 50.w,
          buttonColor: Colors.white54,
          child: RaisedButton(child: Text('이전'),
              onPressed: (){
                if(presentIndex >= categories.length-numOfcategories){
                  setState(() {
                    presentIndex--;
                  });
                }
              }),
        ),
        Container(
          height: 60.h,
          color: Colors.orange,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: numOfcategories,
            itemBuilder: (context, index) => buildCategory(index+presentIndex),
          ),
        ),
        ButtonTheme(
          minWidth: 50.w,
          buttonColor: Colors.white54,
          child: RaisedButton(child: Text('다음'),
              onPressed: (){
                if(presentIndex < categories.length-numOfcategories){
                  setState(() {
                    presentIndex++;
                  });
                }
              }),
        ),
      ],
    );
  }

  GridView buildGridView() {
    return GridView.builder(
        padding: EdgeInsets.all(0),
        itemCount: returnItemCount(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: returnItemRow(),
          mainAxisSpacing: 10.h,
          crossAxisSpacing: 10.w,
          childAspectRatio: 0.8,
        ),
        itemBuilder: (context, index) {
          switch (selectedIndex) {
            case 0:
              pr = coffees;
              break;
            case 1:
              pr = adeNjuices;
              break;
            case 2:
              pr = teas;
              break;
            case 3:
              pr = beverages;
              break;
            case 4 :
              pr = smoothies;
              break;
          }
          if(isPressed == true){
            if(index >= pr.length){
              return Container();
            }
            else{
              return ItemCard(
                product: pr[index],
                press: () =>
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) =>
                            DetailScreen(product: pr[index]))),
              );
            }
          }
          else if(index+numOfItems < pr.length){
            return ItemCard(
              product: pr[index+numOfItems],
              press: () =>
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) =>
                          DetailScreen(product: pr[index+numOfItems]))),
            );
          }
          else return Container();
        }
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white24,
      leading: IconButton(icon: Icon(Icons.arrow_back_ios_outlined), onPressed: () => Navigator.pop(context),),
      title: Column(
        children: [
          Icon(Icons.storefront, size: 35.sp,),
          Text('키오스크 상호명', style: TextStyle(fontSize: 12.sp),)
        ],
      ),
      centerTitle: true,
    );
  }

  Widget buildCategory(int index) {
    final screenSize = MediaQuery.of(context).size;
    return GestureDetector(
      child: ScreenUtilInit(
        designSize: Size(screenSize.width, screenSize.height),
        builder: () => Container(
          width: 70.w,
          decoration: BoxDecoration(
              color: selectedIndex == index ? Colors.white : Colors.orange,
              border: selectedIndex != index ? Border.all(
                color: Colors.black, width: 3.w,) :
              Border(
                  top: BorderSide(
                    color: Colors.black,
                    width: 3.w,),
                  left: BorderSide(
                    color: Colors.black,
                    width: 3.w,),
                  right: BorderSide(
                    color: Colors.black,
                    width: 3.w,),
                  bottom: BorderSide(
                    color: Colors.white,
                    width: 3.w,)
              )
          ),
          child: Center(
              child:Text(
                categories[index],
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15.sp,
                    color: Colors.black
                ),
              )
          ),
        ),
      ),
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
    );
  }

  returnItemCount() {
    switch(ageGroup.selectedAgeGroup){
      case 1 : numOfItems = 16;
      break;
      case 2 : numOfItems = 9;
      break;
      default : numOfItems = 9;
    }
    return numOfItems;
  }

  returnItemRow() {
    switch(ageGroup.selectedAgeGroup){
      case 1 : numOfRows = 4;
      break;
      case 2 : numOfRows = 3;
      break;
      default : numOfRows = 3;
    }
    return numOfRows;
  }
}