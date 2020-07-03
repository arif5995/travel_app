import 'package:flutter/material.dart';
import 'package:travelapp/ui/widget/button_dialog.dart';

Dialog BuildAboutDialog(BuildContext context, Function onPress, String txtBtn){
  return Dialog(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(5.0),
    ),
    child: Container(
      height: MediaQuery.of(context).size.height * 0.5,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Align(
              alignment: Alignment.topRight,
                child: Icon(Icons.close)),
            SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Image.asset('assets/images/travel.png',
                  width: 80, height: 80,),
            ),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text(
                  "Was This Helpful?",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.blue),
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text(
                  "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
                  style: TextStyle(fontSize: 12, color: Colors.black),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: TextFormField(
                  controller: null,
                  decoration: new InputDecoration(
                      hintText: 'Email Address',
                    hintStyle: TextStyle(fontSize: 15),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                      //  when the TextFormField in unfocused
                    ) ,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                  height: 50,
                  child: ButtonDialog(onPress, txtBtn)),
            )
          ],
        ),
      ),
    ),
  );
}