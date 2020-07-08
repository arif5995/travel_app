import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:travelapp/core/model/toursMdl.dart';
import 'package:travelapp/core/string/dataTours.dart';
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

  @override
  void initState() {
    super.initState();
    _tours = ToursData.getData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(top: 180),
          child: ListView.builder(
              itemCount: _tours.length,
              itemBuilder: (context, index) {
                var item = _tours[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: ItemListCitys(itemImg: item.image, itemTitle: item.title),
                );
              }),
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.20,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Hexcolor("#39ACFC"), Hexcolor("#33B8F3")])),
        ),
        Positioned(
          top: 120,
          right: 0.0,
          left: 0.0,
          child: Center(child: SearchText()),
        ),
      ],
    ));
  }
}
