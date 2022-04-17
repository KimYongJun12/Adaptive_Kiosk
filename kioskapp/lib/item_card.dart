import 'package:flutter/material.dart';
import 'package:kioskapp/singleTon.dart';
import 'Product.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ItemCard extends StatefulWidget {
  final Product product;
  final Function press;
  const ItemCard({
    Key key,
    this.product,
    this.press,
  }) : super(key: key);

  @override
  _ItemCardState createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard> {
  var ageGroup = SingletonTwo();
  double imageHeight, imageWidth, titleSize, borderWidth, titlePadding,
      edgePadding;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery
        .of(context)
        .size;

    return GestureDetector(
      onTap: widget.press,
      child: ScreenUtilInit(
        designSize: Size(screenSize.width, screenSize.height),
        builder: () => buildItem(),
      ),
    );
  }

  Container buildItem() {
    if (ageGroup.selectedAgeGroup == 1) {
      edgePadding = 10 * 3 / 4;
      imageHeight = 85 * 3 / 4;
      imageWidth = 85 * 3 / 4;
      titleSize = 14 * 3 / 4;
      borderWidth = 0;
      titlePadding = 6 * 3 / 4;
    }
    else {
      edgePadding = 10;
      imageHeight = 85;
      imageWidth = 85;
      titleSize = 14;
      borderWidth = 3;
      titlePadding = 6;
    }

    return Container(
        padding: EdgeInsets.all(edgePadding.sp),
        decoration: BoxDecoration(
          color: selectColor(),
          borderRadius: BorderRadius.circular(16),
          border: buildBorder(),
        ),
        child: Column(
          children: [
            Container(
              height: imageHeight.h,
              width: imageWidth.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(13),
                  image: DecorationImage(
                      image: AssetImage(widget.product.image),
                      fit: BoxFit.cover
                  )
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: titlePadding.sp),
              child: Text(widget.product.title, textAlign: TextAlign.center,
                style: TextStyle(fontSize: titleSize.sp),),
            ),
          ],
        )
    );
  }

  Border buildBorder(){
    if (ageGroup.selectedAgeGroup == 1) {
      return Border();
    }
    else {
      return Border.all(color: Colors.black, width: 3.w);
    }

  }

  Color selectColor() {
    if (ageGroup.selectedAgeGroup == 1) {
      return const Color(0xffeeeeee);
    }
    else {
      return widget.product.isHot ? Colors.red : Colors.blue;
    }
  }
}

