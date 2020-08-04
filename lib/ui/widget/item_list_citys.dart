import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Container ItemListCitys({BuildContext context, String itemImg, String itemTitle}){
  ScreenUtil.init(context);
  return Container(
    height: 450.h,
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