import 'package:flutter/material.dart';
import 'package:travelapp/core/model/toursMdl.dart';
import 'package:travelapp/core/string/dataTours.dart';
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

  List<ToursMdl> _tours;

  void onPressedRight(){
    setState(() {
      pressRight = true;
      pressLeft = false;
    });
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
    _tours = ToursData.getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF17ead9), Colors.lightBlueAccent],
            ),
          ),
        ),
        title: Text(
          "Explore",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'Banana',
            fontSize: 25.0,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
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
                     _populersToursRight(-3);
                   },
                   onPressRight: (){
                     onPressedLeft();
                     _populersToursRight(3);
                   }
                 ),
                 _listViewPopulersTours(),
                 TitleList(
                     title: "New Offers Tours",
                     boolLeft: pressLeft,
                     boolRight: pressRight,
                     onPressLeft: (){
                       onPressedRight();
                     },
                     onPressRight: (){
                       onPressedLeft();
                     }
                 ),
                 _listViewOffersTours(),
                 TitleList(
                     title: "Best Destinations",
                     boolLeft: pressLeft,
                     boolRight: pressRight,
                     onPressLeft: (){
                       onPressedRight();
                     },
                     onPressRight: (){
                       onPressedLeft();
                     }
                 ),
                 _listViewBestDestination()
               ],
          ))
        ],
      ),
    );
  }

  _populersToursRight(i) => _controller1.animateTo(100.0 * i, duration: Duration(seconds: 2), curve: Curves.fastOutSlowIn);

  SizedBox _listViewPopulersTours() {
    return SizedBox(
      height: 150,
      child: ListView.builder(
          controller: _controller1,
          scrollDirection: Axis.horizontal,
          itemExtent: 120,
          itemCount: _tours.length,
          itemBuilder: (context, index) {
            var item = _tours[index];
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
                        image: NetworkImage(item.image),
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
                          item.title,
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
          }),
    );
  }

  SizedBox _listViewOffersTours() {
    return SizedBox(
      height: 150,
      child: ListView.builder(
          controller: _controller2,
          scrollDirection: Axis.horizontal,
          itemExtent: 120,
          itemCount: _tours.length,
          itemBuilder: (context, index) {
            var item = _tours[index];
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
                            image: NetworkImage(item.image),
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
                          item.title,
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
          }),
    );
  }

  SizedBox _listViewBestDestination() {
    return SizedBox(
      height: 120,
      child: ListView.builder(
          controller: _controller3,
          scrollDirection: Axis.horizontal,
          itemExtent: 200,
          itemCount: _tours.length,
          itemBuilder: (context, index) {
            var item = _tours[index];
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
                            image: NetworkImage(item.image),
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
                          child: Text(item.title, style: TextStyle(fontSize: 20, color: Colors.white70),),
                        ),
                      )
                  ),
                ],
              ),
            );
          }),
    );
  }
}
