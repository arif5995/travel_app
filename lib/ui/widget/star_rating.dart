import 'package:flutter/material.dart';

class StarRating extends StatelessWidget {
  final void Function(int index) onChanged;
  final int value;
  final IconData filledStar;
  final IconData unfilledStar;

  const StarRating({Key key, this.onChanged, this.value, this.filledStar, this.unfilledStar}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).accentColor;
    final size = 16.0;
    return Container(
      width: 90,
      height: 0,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(5, (index) {
          return Expanded(
            flex: 1,
            child: IconButton(
              onPressed: onChanged != null
                  ? () {
                onChanged(value == index + 1 ? index : index + 1);
              }
                  : null,
              color: index < value ? color : null,
              iconSize: size,
              icon: Icon(
                index < value ? filledStar ?? Icons.star : unfilledStar ?? Icons.star_border,
              ),
              padding: EdgeInsets.zero,
              tooltip: "${index + 1} of 5",
            ),
          );
        }),
      ),
    );
  }
}
