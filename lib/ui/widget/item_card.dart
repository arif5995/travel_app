import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
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
                    SizedBox(width: getValueForScreenType<double>(context: context, mobile: 5.0, tablet: 10.0, desktop: 15.0),),
                    _content(context),
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
      width: getValueForScreenType<double>(context: context, mobile: 100.0, tablet: 120, desktop: 250),
      height: getValueForScreenType<double>(context: context, mobile: 100.0, tablet: 120, desktop: 250),
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

  _content(context){
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            txtPlaceName,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          style: TextStyle(
              fontSize: getValueForScreenType<double>(context: context, mobile: 12.0, tablet: 18.0, desktop: 25.0),
              color: Colors.black87,
              fontWeight: FontWeight.w700)
          ),
          SizedBox(height: getValueForScreenType<double>(context: context, mobile: 5.0, tablet: 10.0, desktop: 20.0),),
          CustomRating(
            rating: rating,
            useReview: false,
          ),
          SizedBox(height: getValueForScreenType<double>(context: context, mobile: 5.0, tablet: 10.0, desktop: 20.0),),
          Padding(
            padding: const EdgeInsets.only(right: 5),
            child: Text(
              txtAlamat,
              style: TextStyle(
                fontSize: getValueForScreenType<double>(context: context, mobile: 10.0, tablet: 15.0, desktop: 20.0),
                color: Colors.black45
              ),
            ),
          )
        ],
      ),
    );
  }
}
