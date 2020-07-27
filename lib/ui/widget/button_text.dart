import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

Widget ButtonText({BuildContext context, String text, IconData icon, GestureTapCallback onPress}) {
  return Container(
    padding: EdgeInsets.all(5),
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
                  size: getValueForScreenType<double>(context: context, mobile: 20.0, tablet: 20.0, desktop: 20.0),
                ),
                SizedBox(
                  width: 5,
                ),
                Flexible(
                  child: Text(
                    text,
                    overflow: TextOverflow.ellipsis ,
                    style: TextStyle(color: Colors.blue, fontSize: getValueForScreenType<double>(context: context, mobile: 12.0, tablet: 12.0, desktop: 12.0),),
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
