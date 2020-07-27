import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:travelapp/core/bloc/category_bloc.dart';
import 'package:travelapp/core/bloc/restorant_bloc.dart';
import 'package:travelapp/core/model/category/catagoryResponse.dart';
import 'package:travelapp/ui/widget/appbar.dart';
import 'package:travelapp/ui/widget/button_text.dart';
import 'package:travelapp/ui/widget/item_card.dart';

class HomePage extends StatelessWidget {
  //final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarTop(
          icon: Icons.arrow_back_ios, title: "Flight Result", textRight: ""),
      body: LayoutBody(),
    );
  }
}

class LayoutBody extends StatefulWidget {

  @override
  _LayoutBodyState createState() => _LayoutBodyState();
}

class _LayoutBodyState extends State<LayoutBody> {

 RestorantBloc restorantBloc = RestorantBloc();


  @override
  void initState() {
    restorantBloc.fetchRestorant();
    blocCategory.fetchCategory();
    super.initState();
  }

  @override
  void dispose() {
    restorantBloc.dispose();
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
                    child: StreamBuilder<RestorantState>(
                      stream: restorantBloc.restorant,
                      builder: (context, snapshot) {
                       if (snapshot.hasData){
                         if (snapshot.data is RestorantSuccess){
                           final data =  snapshot.data as RestorantSuccess;
                           return ListView.builder(
                               itemCount: data.restorant.length,
                               itemBuilder: (context, index) {
                                 var item = data.restorant[index];
                                 return ItemCard(
                                   txtPicture: item.restaurant.thumb,
                                   txtPlaceName: item.restaurant.name,
                                   txtAlamat: item.restaurant.location.address,
                                    rating: double.parse(item.restaurant.userRating.aggregateRating));
                               }
                           );
                         }else if (snapshot.data is RestorantError){
                           final error = snapshot.data as RestorantError;
                           return _buildError(message: error.error);
                         } return Container();
                       }else if (snapshot.hasError) { //! cek snapshot error
                         return _buildError(message: "Error");
                       } else {
                         return _buildProgress();
                       }
                      }
                    ),
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.10,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 150,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(10))),
                  child: Center(
                    child: StreamBuilder<StateCategory>(
                        stream: blocCategory.category,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            if (snapshot.data is StateCategoryError){
                              final error = snapshot.data as StateCategoryError;
                              return Center(child: Text(error.error),);
                            } else if (snapshot.data is StateCategorySuccess);
                            final data = snapshot.data as StateCategorySuccess;
                            return _cardHome(lenghtCategory: data.list, context: context);
                          } else if (snapshot.hasError) {
                            return Text("error");
                          }
                          return Container();
                        }),
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

 Center _buildError({String message}) {
   return Center(
     child: Text(message),
   );
 }

 Center _buildProgress() {
   return Center(child: CircularProgressIndicator(),
   );
 }
}

Widget _cardHome({List<Category> lenghtCategory, BuildContext context}) {
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
              childAspectRatio: 2 / 1,
              crossAxisSpacing: 2,
              crossAxisCount: 3,
            ),
            itemCount: lenghtCategory.length > 6 ? 6 : lenghtCategory.length, //! untuk mengatur jumlah item, jika lebih dari 6 maka jumlahnya 6
            itemBuilder: (context, index) {
              var item = lenghtCategory[index];
              if (index == 5) { //! menampilkan icon more pada akhir grid
                return IconButton(
                    icon: Icon(
                      Icons.more_horiz,
                      size: 20,
                      color: Colors.blue,
                    ),
                    onPressed: () => _bottomSheet(context: context, lenghtCategory: lenghtCategory));
              } else { //! menampilkan nama kategori
                return ButtonText(
                    text: item.categories.name,
                    icon: Icons.category,
                    onPress: () {});
              }
            },
          ),
        ),
      ],
    ),
  );
}

Widget _bottomSheet({BuildContext context, List<Category> lenghtCategory}) {
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
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: GridView.builder(
                shrinkWrap: true,
                  gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 2 / 1,
                crossAxisSpacing: 2,
                crossAxisCount: 3,
              ),
                  itemCount: lenghtCategory.length,
                  itemBuilder: (context, index){
                    var item = lenghtCategory[index];
                    return ButtonText(
                        text: item.categories.name,
                        icon: Icons.category,
                        onPress: () {});
                  }),
            )
          ]),
        );
      });
}
