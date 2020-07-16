import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget ButtonText({String text, IconData icon, GestureTapCallback onPress}) {
  return Container(
    padding: EdgeInsets.all(10),
    child: RawMaterialButton(
      onPressed: onPress,
      splashColor: Colors.grey,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Icon(
            icon,
            color: Colors.blue,
            size: 20,
          ),
          SizedBox(
            width: 5,
          ),
          Flexible(
            child: Text(
              text,
              overflow: TextOverflow.ellipsis ,
              style: TextStyle(color: Colors.blue, fontSize: 12),
            ),
          ),
        ],
      ),
    ),
  );
}
