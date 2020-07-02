import 'package:flutter/material.dart';
import 'package:rate_my_app/rate_my_app.dart';
import 'package:travelapp/ui/widget/item_card.dart';
import 'package:travelapp/ui/widget/options_card.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF17ead9), Colors.lightBlueAccent],
            ),
          ),
        ),
        title: Text(
          "Flights Result",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'Banana',
            fontSize: 25.0,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: GestureDetector(
          onTap: null,
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
      ),
      body: LayoutBody(),
    );
  }
}

class LayoutBody extends StatefulWidget {
  @override
  _LayoutBodyState createState() => _LayoutBodyState();
}

class _LayoutBodyState extends State<LayoutBody> {
  RateMyApp _rateMyApp = RateMyApp(
    preferencesPrefix: 'rateMyApp_',
    minDays: 3,
    minLaunches: 7,
    remindDays: 2,
    remindLaunches: 5,
    // appStoreIdentifier: '',
    // googlePlayIdentifier: '',
  );
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children:<Widget> [
          Column(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Color(0xFF17ead9), Colors.lightBlueAccent])),
                ),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 90),
                    child: ListView(
                      children: <Widget>[
                        ItemCard(),
                        ItemCard(),
                        ItemCard(),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            top: 100,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 150,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius:
                      const BorderRadius.all(Radius.circular(10))),
                  child: OptionsCards(),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

