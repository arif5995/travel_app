import 'package:flutter/material.dart';
import 'package:travelapp/ui/widget/star_rating.dart';

class ProfilPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: StarRating(
          onChanged: (index){
          },
          value: 0,
          unfilledStar: Icons.star_border,
          filledStar: Icons.star,
        ),
      ),
    );
  }
}
