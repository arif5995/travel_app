import 'package:flutter/material.dart';

Container SearchText({TextEditingController controller, Function onChange, Function onPress }){
  return Container(
      alignment: Alignment.center,
      height: 60,
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius:
            const BorderRadius.all(Radius.circular(15))),
        child: ListTile(
          leading: Icon(Icons.search, color: Colors.grey,),
          title: TextField(
            controller: controller,
            onChanged: onChange,
            style: TextStyle(fontSize: 17, color: Colors.black54),
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: "Search",
              hintStyle: TextStyle(fontSize: 17, color: Colors.grey),
            ),
          ),
          trailing: IconButton(
            onPressed: onPress,
            icon: Icon(Icons.cancel, color: Colors.grey,),
          ),
        ),
      )
  );
}