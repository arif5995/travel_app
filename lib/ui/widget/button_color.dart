import 'package:flutter/material.dart';
Widget ButtonColor({String text, GestureTapCallback onPress}) {
  return RawMaterialButton(
    fillColor: Colors.blue,
    onPressed: onPress,
    splashColor: Colors.grey,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(18.0),
    ),
    child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            text,
            maxLines: 1,
            style: TextStyle(color: Colors.white, fontSize: 12),
          ),
        ],
      ),
    ),
  );
}
