import 'package:flutter/material.dart';

Container SearchText(){
  return Container(
      height: 60,
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius:
            const BorderRadius.all(Radius.circular(15))),
        child: TextField(
          controller: null,
          style: TextStyle(fontSize: 17, color: Colors.black54),
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.search),
            border: InputBorder.none,
            hintText: "Search",
            hintStyle: TextStyle(fontSize: 17, color: Colors.grey),
          ),
        ),
      )
  );
}