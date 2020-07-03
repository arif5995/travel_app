import 'package:flutter/material.dart';
import 'package:rate_my_app/rate_my_app.dart';
import 'package:travelapp/core/string/string.dart';
import 'package:travelapp/ui/widget/item_card.dart';
import 'package:travelapp/ui/widget/options_card.dart';

class HomePage extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
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
      body: LayoutBody(scaffoldKey: scaffoldKey,),
    );
  }
}

class LayoutBody extends StatefulWidget {
  final GlobalKey scaffoldKey;

  LayoutBody({this.scaffoldKey});
  @override
  _LayoutBodyState createState() => _LayoutBodyState();
}

class ItemList{
  final String gambar, tempat, harga;

  ItemList({this.gambar, this.tempat, this.harga});
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

  final List<ItemList> _itemCards = [
     ItemList(gambar: Gambar.img1, tempat: "Bali", harga: "7000"),
     ItemList(gambar: Gambar.img2, tempat: "Autrslia", harga: "17000"),
     ItemList(gambar: Gambar.img3, tempat: "Roma", harga: "71000"),
  ];
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
                    child:ListView.builder(
                      itemCount: _itemCards.length,
                      itemBuilder: (context,index){
                        return new ItemCard(txtPicture: _itemCards[index].gambar, txtPlaceName: _itemCards[index].tempat, txtPrice: _itemCards[index].harga);
                      },
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
                  child: OptionsCards(txtBtnDialog: "SIGN ME UP"),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

