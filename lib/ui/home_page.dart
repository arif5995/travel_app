import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:rate_my_app/rate_my_app.dart';
import 'package:travelapp/core/bloc/category_bloc.dart';
import 'package:travelapp/core/model/category/catagoryResponse.dart';
import 'package:travelapp/core/string/string.dart';
import 'package:travelapp/ui/widget/appbar.dart';
import 'package:travelapp/ui/widget/button_color.dart';
import 'package:travelapp/ui/widget/button_text.dart';
import 'package:travelapp/ui/widget/item_card.dart';

class HomePage extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBarTop(
          icon: Icons.arrow_back_ios, title: "Flight Result", textRight: ""),
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

class ItemList {
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
  void initState() {
    blocCategory.fetchCategory();
    super.initState();
  }

  @override
  void dispose() {
    blocCategory.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Hexcolor("#39ACFC"), Hexcolor("#33B8F3")])),
                ),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 90),
                    child: ListView.builder(
                      itemCount: _itemCards.length,
                      itemBuilder: (context, index) {
                        return new ItemCard(
                            txtPicture: _itemCards[index].gambar,
                            txtPlaceName: _itemCards[index].tempat,
                            txtPrice: _itemCards[index].harga);
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            top: MediaQuery
                .of(context)
                .size
                .height * 0.10,
            child: Container(
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              height: 150,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius:
                      const BorderRadius.all(Radius.circular(10))),
                  child: Center(
                    child: StreamBuilder<List<Category>>(
                        stream: blocCategory.category,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return _cardHome(lenghtCategory: snapshot, context: context);
                          } else if (snapshot.hasError) {
                            return Text("error");
                          }
                          return Container();
                        }
                    ),
                  ),
                  //OptionsCards(txtBtnDialog: "SIGN ME UP"),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

Widget _cardHome({AsyncSnapshot<List<Category>> lenghtCategory, BuildContext context}) {
  return Padding(
    padding: const EdgeInsets.all(5.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Expanded(
          child: GridView.builder(
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 16/8,
                crossAxisSpacing: 2,
                crossAxisCount: 3,
            ),
            itemCount: lenghtCategory.data.length,
            itemBuilder: (context, index) {
              var item = lenghtCategory.data[index];
              if (lenghtCategory.data.length > 6){
                if (index == 5){
                  return IconButton(icon: Icon(Icons.more_horiz, size: 20, color: Colors.blue,), onPressed: (){});
                }
                return ButtonText(text: item.categories.name, icon: Icons.category, onPress: (){});
              } else if (lenghtCategory.data.length < 6){
                return ButtonText(text: item.categories.name, icon: Icons.category, onPress: (){});
              } return Container();
            },
          ),
        ),
      ],
    ),
  );
}

Widget _bottomSheet(BuildContext context) {
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
