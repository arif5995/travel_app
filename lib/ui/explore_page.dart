import 'package:flutter/material.dart';
import 'package:travelapp/core/bloc/category_bloc.dart';
import 'package:travelapp/core/bloc/collections_bloc.dart';
import 'package:travelapp/core/bloc/cuisines_bloc.dart';
import 'package:travelapp/core/model/toursMdl.dart';
import 'package:travelapp/core/string/dataTours.dart';
import 'package:travelapp/ui/widget/appbar.dart';
import 'package:travelapp/ui/widget/star_rating.dart';
import 'package:travelapp/ui/widget/title_explore.dart';

class ExplorePage extends StatefulWidget {
  @override
  _ExplorePageState createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  final _controller1  = ScrollController();
  final _controller2  = ScrollController();
  final _controller3  = ScrollController();
  bool pressRight = true;
  bool pressLeft  = true;
  Color _iconColor = Colors.grey;
  CuisinesBloc cuisinesBloc = CuisinesBloc();
  CollectionBlocs collectionBlocs = CollectionBlocs();

  //List<ToursMdl> _tours;

  void onPressedRight(){
    setState(() {
      pressRight = true;
      pressLeft = false;
    });
  }

  @override
  void dispose() {
    cuisinesBloc.dispose();
    collectionBlocs.dispose();
    blocCategory.dispose();
    super.dispose();
  }

  void onPressedLeft(){
    setState(() {
      pressRight = false;
      pressLeft = true;
    });
  }

  @override
  void initState() {
    super.initState();
    blocCategory.fetchCategory();
    collectionBlocs.add(CollectionEvent(text: null));
    cuisinesBloc.fetchCuisines();
    //_tours = ToursData.getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarTop(title: "Explore", icon: null, textRight: ""),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 15,
          ),
          Expanded(
              child: ListView(
               children: <Widget>[
                 TitleList(
                   title: "Populer Tours",
                   boolLeft: pressLeft,
                   boolRight: pressRight,
                   onPressLeft: (){
                     onPressedRight();
                     _populersTours(-3);
                   },
                   onPressRight: (){
                     onPressedLeft();
                     _populersTours(3);
                   }
                 ),
                 _listViewPopulersTours(),
                 TitleList(
                     title: "New Offers Tours",
                     boolLeft: pressLeft,
                     boolRight: pressRight,
                     onPressLeft: (){
                       onPressedRight();
                       _offersTours(-3);
                     },
                     onPressRight: (){
                       onPressedLeft();
                       _offersTours(3);
                     }
                 ),
                 _listViewOffersTours(),
                 TitleList(
                     title: "Best Destinations",
                     boolLeft: pressLeft,
                     boolRight: pressRight,
                     onPressLeft: (){
                       onPressedRight();
                       _bestDestination(-3);
                     },
                     onPressRight: (){
                       onPressedLeft();
                       _bestDestination(3);
                     }
                 ),
                 _listViewBestDestination()
               ],
          ))
        ],
      ),
    );
  }

  _populersTours(i) => _controller1.animateTo(100.0 * i, duration: Duration(seconds: 2), curve: Curves.fastOutSlowIn);
  _offersTours(i) => _controller2.animateTo(100.0 * i, duration: Duration(seconds: 2), curve: Curves.fastOutSlowIn);
  _bestDestination(i) => _controller3.animateTo(100.0 * i, duration: Duration(seconds: 2), curve: Curves.fastOutSlowIn);

  SizedBox _listViewPopulersTours() {
    return SizedBox(
      height: 150,
      child: StreamBuilder<StateCuisines>(
        stream: cuisinesBloc.cuisiness,
        builder: (context, snapshot) {
          if (snapshot.hasData){
            if (snapshot.data is StateCuisinesError){
              final error = snapshot.data as StateCuisinesError;
              return Center(child: Text(error.error),);
            } else if (snapshot.data is StateCuisinesSucces){
              final data = snapshot.data as StateCuisinesSucces;
              return ListView.builder(
                  controller: _controller1,
                  scrollDirection: Axis.horizontal,
                  itemExtent: 120,
                  itemCount: data.list.length,
                  itemBuilder: (context, index) {
                    var item = data.list[index];
                    return Padding(
                      padding:
                      const EdgeInsets.symmetric(horizontal: 4.0, vertical: 4.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Expanded(
                              flex: 2,
                              child: Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage("assets/images/icon_profil.jpg"),
                                    fit: BoxFit.cover,
                                    colorFilter: ColorFilter.mode(
                                      Colors.black26,
                                      BlendMode.darken,
                                    ),
                                  ),
                                  borderRadius: BorderRadius.circular(10.0),
                                  color: Colors.grey,
                                ),
                              )
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Expanded(
                            flex: 1,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Text(
                                  item.cuisine.cuisineName,
                                  style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                                ),
                                StarRating(
                                  onChanged: null,
                                  value: 0,
                                  unfilledStar: Icons.star_border,
                                  filledStar: Icons.star,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  });
            }

          }else if(snapshot.hasError){
            return Text(snapshot.hasError.toString());
          } return Container();
        }
      ),
    );
  }

  SizedBox _listViewOffersTours() {
    return SizedBox(
      height: 150,
      child: StreamBuilder<StateCategory>(
        stream: blocCategory.category,
        builder: (context, snapshot) {
          if(snapshot.hasData){
            if (snapshot.data is StateCategoryError){
              final error = snapshot.data as StateCategoryError;
              return Center(child: Text(error.error),);
            } else if (snapshot.data is StateCategorySuccess){
              final data = snapshot.data as StateCategorySuccess;
              return ListView.builder(
                  controller: _controller2,
                  scrollDirection: Axis.horizontal,
                  itemExtent: 120,
                  itemCount: data.list.length,
                  itemBuilder: (context, index) {
                    var item = data.list[index];
                    return Padding(
                      padding:
                      const EdgeInsets.symmetric(horizontal: 4.0, vertical: 4.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Expanded(
                              flex: 2,
                              child: Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage("assets/images/icon_profil.jpg"),
                                    fit: BoxFit.cover,
                                    colorFilter: ColorFilter.mode(
                                      Colors.black26,
                                      BlendMode.darken,
                                    ),
                                  ),
                                  borderRadius: BorderRadius.circular(10.0),
                                  color: Colors.grey,
                                ),
                              )
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Expanded(
                            flex: 1,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Text(
                                  item.categories.name,
                                  style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                                ),
                                StarRating(
                                  onChanged: null,
                                  value: 0,
                                  unfilledStar: Icons.star_border,
                                  filledStar: Icons.star,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  });
            }
          }return Center(child: CircularProgressIndicator(),);
        }
      ),
    );
  }

  SizedBox _listViewBestDestination() {
    return SizedBox(
      height: 120,
      child: StreamBuilder<CollectionState>(
        stream: collectionBlocs.stateStream,
        builder: (context, snapshot) {
          if (snapshot.hasData){
            if (snapshot.data is CollectionError){
              final error = snapshot.data as CollectionError;
              return Center(child: Text(error.errorMessage),);
            }else if (snapshot.data is CollectionList){
              final list = snapshot.data as CollectionList;
              return ListView.builder(
                  controller: _controller3,
                  scrollDirection: Axis.horizontal,
                  itemExtent: 200,
                  itemCount: list.collection.length,
                  itemBuilder: (context, index) {
                    var item = list.collection[index];
                    return Padding(
                      padding:
                      const EdgeInsets.symmetric(horizontal: 4.0, vertical: 4.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Expanded(
                              flex: 2,
                              child: Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(item.collection.imageUrl),
                                    fit: BoxFit.cover,
                                    colorFilter: ColorFilter.mode(
                                      Colors.black26,
                                      BlendMode.darken,
                                    ),
                                  ),
                                  borderRadius: BorderRadius.circular(10.0),
                                  color: Colors.grey,
                                ),
                                child: Center(
                                  child: Text(item.collection.title, style: TextStyle(fontSize: 20, color: Colors.white70),),
                                ),
                              )
                          ),
                        ],
                      ),
                    );
                  });
            }return Container();
          }return Center(child: CircularProgressIndicator(),);
        }
      ),
    );
  }
}
