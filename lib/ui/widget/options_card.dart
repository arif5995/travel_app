import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OptionsCards extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: ButtonText(
                  text: "First Class",
                  icon: Icons.star,
                  onPress: null
                ),
              ),

              Expanded(
                flex: 1,
                child: ButtonText(
                    text: "800 E",
                    icon: Icons.monetization_on,
                    onPress: null
                ),
              ),

              Expanded(
                flex: 1,
                child: ButtonText(
                    text: "1 Passenger",
                    icon: Icons.person,
                    onPress: null
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: ButtonText(
                    text: "Dubai, UAE",
                    icon: Icons.location_on,
                    onPress: (){

                    }
                ),
              ),
              Expanded(
                flex: 1,
                child: ButtonText(
                    text: "Mar, 7.2017",
                    icon: Icons.date_range,
                    onPress: null
                ),
              ),

              Expanded(
                flex: 1,
                child: ButtonColor(
                    text: "Edit Search",
                    onPress: (){

                    }
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

Widget ButtonText({String text, IconData icon, GestureTapCallback onPress}){
  return RawMaterialButton(
    onPressed: onPress,
    splashColor: Colors.grey,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(18.0),),
    child: Padding(
      padding: const EdgeInsets.all(5),
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
          Text(
            text,
            maxLines: 1,
            style: TextStyle(color: Colors.blue, fontSize: 12),
          ),
        ],
      ),
    ),
  );
}


Widget ButtonColor({String text, GestureTapCallback onPress}){
  return RawMaterialButton(
    fillColor: Colors.blue,
    onPressed: onPress,
    splashColor: Colors.grey,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18.0),),
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