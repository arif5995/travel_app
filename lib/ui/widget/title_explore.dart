import 'package:flutter/material.dart';

Container TitleList({String title,bool boolLeft, bool boolRight, Function onPressLeft, Function onPressRight}){
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 15),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Expanded(
          flex: 3,
          child: Text(
            title,
            style: TextStyle(
                fontSize: 14,
                color: Colors.black,
                fontWeight: FontWeight.bold),
          ),
        ),
        IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: boolLeft ? Colors.grey : Colors.blue,
              size: 14,
            ),
            onPressed: onPressLeft),
        IconButton(
            icon: Icon(
              Icons.arrow_forward_ios,
              color: boolRight ? Colors.grey : Colors.blue,
              size: 14,
            ),
            onPressed: onPressRight )
      ],
    ),
  );
}