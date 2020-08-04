import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget ButtonText({String text, IconData icon, GestureTapCallback onPress}) {
  return Container(
    child: Center(
      child: RawMaterialButton(
        onPressed: onPress,
        splashColor: Colors.grey,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Row(
              children: <Widget>[
                Icon(
                  icon,
                  color: Colors.blue,
                  size: 20.0,
                ),
                SizedBox(
                  width: 5.0,
                ),
                Flexible(
                  child: Text(
                    text,
                    overflow: TextOverflow.ellipsis ,
                    style: TextStyle(color: Colors.blue, fontSize: 12,),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
