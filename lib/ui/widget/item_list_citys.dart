import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsive_builder/responsive_builder.dart';

Container ItemListCitys({BuildContext context, String itemImg, String itemTitle}){
  ScreenUtil.init(context);
  return Container(
    height: getValueForScreenType(
                context: context,
                mobile: 150,
                tablet: 150,
                desktop: 120,
              ),
    decoration: BoxDecoration(
      image: DecorationImage(
        image: NetworkImage(itemImg),
        fit: BoxFit.cover,
        colorFilter: ColorFilter.mode(
          Colors.black26,
          BlendMode.darken,
        ),
      ),
      borderRadius: BorderRadius.circular(10.0),
      color: Colors.grey,
    ),
    child: Center(
      child: Text(itemTitle, style: TextStyle(fontSize: ScreenUtil().setSp(40, allowFontScalingSelf: true), color: Colors.white70),),
    ),
  );
}