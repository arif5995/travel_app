import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travelapp/core/string/string.dart';
import 'package:travelapp/ui/widget/star_rating.dart';

class ItemCard extends StatelessWidget {
  final String txtPicture, txtPlaceName, txtPrice;
  final Function onChanged;

  ItemCard({this.txtPicture, this.txtPlaceName, this.txtPrice, this.onChanged});


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        height: 120,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
          ),
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Container(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width * 0.4,
                  height: MediaQuery
                      .of(context)
                      .size
                      .height,
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8.0),
                      bottomLeft: Radius.circular(8.0),
                    ),
                    child:
//                    CachedNetworkImage(
//                        imageUrl: txtPicture,
//                        fit: BoxFit.fill,
//                    )

                    Image.network(
                      txtPicture,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Align(
                      alignment: Alignment.topLeft,
                      child: StarRating(
                        onChanged: onChanged,
                        value: 0,
                        unfilledStar: Icons.star_border,
                        filledStar: Icons.star,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(txtPlaceName, overflow: TextOverflow.fade, style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold
                            ),)
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 5),
                            child: Align(
                              alignment: Alignment.topRight,
                              child: Icon(
                                Icons.favorite, color: Colors.pink,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 5, top: 10, bottom: 5),
                        child: Text(
                          txtPrice,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                            fontSize: 15
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
