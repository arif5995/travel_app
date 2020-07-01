import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travelapp/core/string/string.dart';

class ItemCard extends StatelessWidget {
  final String textImg;

  const ItemCard({Key key, this.textImg}) : super(key: key);
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
              Container(
                width: MediaQuery.of(context).size.width * 0.4,
                height: MediaQuery.of(context).size.height,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8.0),
                    bottomLeft: Radius.circular(8.0),
                  ),
                  child: Image.network(
                    Gambar.img3,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Text("Bali", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
                        SizedBox(
                          width: 110,
                        ),
                        Icon(
                          Icons.favorite, color: Colors.grey,
                        ),
                      ],
                    ),
                    Text("nama Tempat", style: TextStyle(fontSize: 12),),
                    SizedBox(
                      height: 30,
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        child: Text("Harga", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
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
