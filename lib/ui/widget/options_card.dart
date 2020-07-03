import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travelapp/ui/widget/dialog_popup.dart';

class OptionsCards extends StatelessWidget {
  final Function onPressDialog;
  final String txtBtnDialog;

  OptionsCards({this.onPressDialog, this.txtBtnDialog});

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
                    text: "First Class", icon: Icons.star, onPress: null),
              ),
              Expanded(
                flex: 1,
                child: ButtonText(
                    text: "800 E", icon: Icons.monetization_on, onPress: null),
              ),
              Expanded(
                flex: 1,
                child: ButtonText(
                    text: "1 Passenger",
                    icon: Icons.person,
                    onPress: () => _bottomSheet(context)),
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
                    onPress: () {}),
              ),
              Expanded(
                flex: 1,
                child: ButtonText(
                    text: "Mar, 7.2017", icon: Icons.date_range, onPress: null),
              ),
              Expanded(
                flex: 1,
                child: ButtonColor(
                    text: "Edit Search",
                    onPress: () {
                      showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (BuildContext context) => BuildAboutDialog(
                              context, onPressDialog, txtBtnDialog));
                    }),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

Widget ButtonText({String text, IconData icon, GestureTapCallback onPress}) {
  return RawMaterialButton(
    onPressed: onPress,
    splashColor: Colors.grey,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(18.0),
    ),
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

_bottomSheet(BuildContext context) {
  showModalBottomSheet(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
        topLeft: Radius.circular(24.0),
        topRight: Radius.circular(24.0),
      )),
      backgroundColor: Colors.white,
      context: context,
      builder: (context) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.5,
          color: Colors.transparent,
//          decoration: BoxDecoration(
//            color: Colors.white,
//            borderRadius: BorderRadius.only(
//              topLeft: Radius.circular(24.0),
//              topRight: Radius.circular(24.0),
//            ),
//          ),
          child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Text(
                  "Daftar Nama",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text("Muhammad Arif"),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text("Jihan Ardilla"),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text("Ayu"),
              onTap: () {},
            ),
          ]),
        );
      });
}
