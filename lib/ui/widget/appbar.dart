import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

AppBar AppBarTop({IconData icon,String title, textRight}){
  return AppBar(
    automaticallyImplyLeading: false,
    centerTitle: true,
    elevation: 1.0,
    flexibleSpace: Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Hexcolor("#39ACFC"), Hexcolor("#33B8F3") ],
        ),
      ),
    ),
    title: Text(
      title,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontFamily: 'Banana',
        fontSize: 25.0,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    ),
    actions: <Widget>[
      Center(
        child: Padding(
          padding: const EdgeInsets.only(right: 15),
          child: Text(textRight, style: TextStyle(fontSize: 12, color: Colors.white),),
        ),
      ),
    ],
    leading: GestureDetector(
      onTap: null,
      child: Icon(
        icon,
        color: Colors.white,
      ),
    ),
  );
}