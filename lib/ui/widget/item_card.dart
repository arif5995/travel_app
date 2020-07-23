import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travelapp/ui/widget/custom_rating.dart';

class ItemCard extends StatelessWidget {
  final String txtPicture, txtPlaceName, txtAlamat;
  final Function onChanged;
  final double rating;

  ItemCard({this.txtPicture, this.txtPlaceName, this.txtAlamat, this.onChanged, this.rating});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Container(
        child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
            ),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    _imageRestorant(context),
                    SizedBox(width: 5,),
                    _content(),
                  ],
                ),
                //Divider(color: Colors.black12),
              ],
            )
        ),
      ),
    );
  }

  _imageRestorant(context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(8.0),
            topLeft: Radius.circular(8.0),
          ),
          image: DecorationImage(
              image: NetworkImage(txtPicture),
              fit: BoxFit.cover
          )
      ),
    );
  }

  _content(){
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            txtPlaceName,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          style: TextStyle(
              fontSize: 12.0,
              color: Colors.black87,
              fontWeight: FontWeight.w700)
          ),
          SizedBox(height: 5,),
          CustomRating(
            rating: rating,
            useReview: false,
          ),
          SizedBox(height: 5,),
          Padding(
            padding: const EdgeInsets.only(right: 5),
            child: Text(
              txtAlamat,
              style: TextStyle(
                fontSize: 10,
                color: Colors.black45
              ),
            ),
          )
        ],
      ),
    );
  }
}
