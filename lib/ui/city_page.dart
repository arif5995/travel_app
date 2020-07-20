import 'package:android_intent/android_intent.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:travelapp/core/bloc/collections_bloc.dart';
import 'package:travelapp/core/model/toursMdl.dart';
import 'package:travelapp/ui/widget/appbar.dart';
import 'package:travelapp/ui/widget/item_list_citys.dart';
import 'package:travelapp/ui/widget/search_text.dart';

class CityPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarTop(icon: null, title: "Collections", textRight: ""),
      body: LayoutBodyCity(),
    );
  }
}

class LayoutBodyCity extends StatefulWidget {
  @override
  _LayoutBodyCityState createState() => _LayoutBodyCityState();
}

class _LayoutBodyCityState extends State<LayoutBodyCity> {
  List<ToursMdl> _tours;
  TextEditingController controllerSearch = new TextEditingController();
  CollectionBlocs collectionBlocs = CollectionBlocs();
  var collectionLoad = false;

  Future _checkGps() async {
    if (!(await Geolocator().isLocationServiceEnabled())) {
      if (Theme.of(context).platform == TargetPlatform.android) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Can't get gurrent location"),
              content:
              const Text('Please make sure you enable GPS and try again'),
              actions: <Widget>[
                FlatButton(
                  child: Text('Ok'),
                  onPressed: () {
                    final AndroidIntent intent = AndroidIntent(
                        action: 'android.settings.LOCATION_SOURCE_SETTINGS');

                    intent.launch();
                    Navigator.of(context, rootNavigator: true).pop();
                  },
                ),
              ],
            );
          },
        );
      }
    }
  }

  @override
  void initState() {
    collectionBlocs.add(CollectionEvent(text: null));
    _checkGps();
    super.initState();
  }

  @override
  void dispose() {
    collectionBlocs.dispose();
    //blocCollection.dispose();
    super.dispose();
  }

  void onSearch(String text){
    if (text.isEmpty){
      setState(() {});
      return;
    }
    collectionBlocs.add(CollectionEvent(text: text));
    setState(() {});
    print("on search: ${controllerSearch.text}");
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).size.height * 0.20 + 30,
          ),
          child:  StreamBuilder<CollectionState>(
                  stream: collectionBlocs.stateStream,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      if (snapshot.data is CollectionList){
                          final data = snapshot.data as CollectionList;
                          return ListView.builder(
                              itemCount: data.collection.length,
                              shrinkWrap: true,
                              physics: ClampingScrollPhysics(),
                              itemBuilder: (context, index) {
                                var item = data.collection[index];
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 20),
                                  child: ItemListCitys(
                                      itemImg: item.collection.imageUrl,
                                      itemTitle: item.collection.title),
                                );
                              });
                      }
                    }return Center(child: CircularProgressIndicator(),);
                  }),
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.20,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Hexcolor("#39ACFC"), Hexcolor("#33B8F3")])),
        ),
        Positioned(
          top: MediaQuery.of(context).size.height * 0.20 - 30,
          right: 0.0,
          left: 0.0,
          child: SearchText(
              controller: controllerSearch,
              onChange: onSearch,
              onPress: (){
                controllerSearch.clear();
                collectionBlocs.add(CollectionEvent(text: null));
              }
          ),
          //api = cfd175d769fd9f8f63071f7b75d77a8d
        ),
      ],
    ));
  }
}
