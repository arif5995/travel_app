import 'package:flutter/material.dart';
import 'package:travelapp/core/model/toursMdl.dart';
import 'package:travelapp/core/string/dataTours.dart';
import 'package:travelapp/ui/widget/star_rating.dart';

class ExplorePage extends StatefulWidget {
  @override
  _ExplorePageState createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  bool pressAttention = true;
  bool pressAttention1 = true;

  List<ToursMdl> _tours;

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
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 15,
            ),
            Expanded(
                child: ListView(
                 children: <Widget>[
                   _titleList("Populer Tours"),
                   _listViewPopulersTours(),
                   _titleList("New Offers Tours"),
                   _listViewPopulersTours(),
                   _titleList("Best Destination"),
                   _listViewBestDestination()
                 ],
            ))
          ],
        ),
      ),
    );
  }


 Container _titleList(String title){
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            flex: 3,
            child: Text(
              title,
              style: TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
          ),
          IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                color: pressAttention ? Colors.grey : Colors.blue,
                size: 14,
              ),
              onPressed: () =>
                  setState(() => pressAttention = !pressAttention)),
          IconButton(
              icon: Icon(
                Icons.arrow_forward_ios,
                color: pressAttention1 ? Colors.grey : Colors.blue,
                size: 14,
              ),
              onPressed: () =>
                  setState(() => pressAttention1 = !pressAttention1))
        ],
      ),
    );
 }

  SizedBox _listViewPopulersTours() {
    return SizedBox(
      height: 150,
      child: ListView.builder(
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
