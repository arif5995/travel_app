import 'package:flutter/material.dart';

Container ItemListCitys({String itemImg, String itemTitle}){
  return Container(
    height: 150,
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
      child: Text(itemTitle, style: TextStyle(fontSize: 30, color: Colors.white70),),
    ),
  );
}