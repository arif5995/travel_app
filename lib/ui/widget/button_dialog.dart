import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

RawMaterialButton ButtonDialog(Function onPress, String txtBtn){
  return RawMaterialButton(
    splashColor: Colors.grey,
    onPressed: onPress,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
    padding: const EdgeInsets.all(0.0),
    child: Ink(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF17ead9), Colors.lightBlueAccent],
        ),
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
      ),
      child: Container(
        constraints: const BoxConstraints(minWidth: 88.0, minHeight: 36.0), // min sizes for Material buttons
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.send, color: Colors.white, size: 20,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              txtBtn,
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    ),
  );
}