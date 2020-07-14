import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:travelapp/core/bloc/citys_bloc.dart';
import 'package:travelapp/core/model/city/collectionss.dart';
import 'package:travelapp/core/model/citys_model.dart';
import 'package:travelapp/core/model/toursMdl.dart';
import 'package:travelapp/core/repositories/city_repo.dart';
import 'package:travelapp/core/repositories/city_repositories.dart';
import 'package:travelapp/ui/widget/appbar.dart';
import 'package:travelapp/ui/widget/item_list_citys.dart';
import 'package:travelapp/ui/widget/search_text.dart';

class CityPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarTop(icon: null, title: "Citys", textRight: ""),
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
  List<CollectionElement> collections;
  var collectionLoad = false;

  getDataCity(){
    setState(() {
      collectionLoad = false;
    });
    blocCity.fetchCities().then((value) {
      setState(() {
        collections = value;
        print("Counter ${collections.length}");
        if (collections.length > 0){
          collectionLoad = true;
        } else {
          collectionLoad = false;
        }
      });
    });
  }

  @override
  void initState() {
    //getDataCity();
    blocCity.fetchCities();
    super.initState();
  }

  @override
  void dispose() {
    blocCity.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.20 + 30,),
          child: StreamBuilder<List<CollectionElement>>(
              stream: blocCity.cities,
              builder: (context, AsyncSnapshot<List<CollectionElement>> snapshot) {
                if (snapshot.hasData){
                  return ListView.builder(
                      itemCount: snapshot.data.length,
                      shrinkWrap: true,
                      physics: ClampingScrollPhysics(),
                      itemBuilder: (context, index) {
                        var item = snapshot.data[index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                          child: ItemListCitys(itemImg: item.collection.imageUrl, itemTitle: item.collection.title),
                        );
                      });
                }else if(snapshot.hasError) {
                  return Text(snapshot.error.toString());
                }return Center(
                  child: CircularProgressIndicator(),
                );
              }
          ),
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
            child: SearchText(),
            //api = cfd175d769fd9f8f63071f7b75d77a8d
          ),
      ],
    ));
  }
}
