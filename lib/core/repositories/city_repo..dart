import 'dart:convert';

import 'package:travelapp/core/model/city/collections.dart';
import 'package:travelapp/core/model/city/collectionss.dart';
import 'package:http/http.dart' as http;

class ServiceCity {
  static Future<Collectionss> getCollection() async {
    try {
      final response = await http.get(
        "https://developers.zomato.com/api/v2.1/collections?city_id=1&lat=0.0&lon=0.0&count=10",
        headers: {"user-key": "cfd175d769fd9f8f63071f7b75d77a8d"}
      );
      print(response.statusCode);
      print(response.body);

      if ( 200 == response.statusCode){
        Collectionss collectionss = parsePhotos(response.body);
        return collectionss;
      } else {
        Collectionss collectionss = new Collectionss();
        collectionss.collectionss = [];
        return collectionss;
      }
    }catch (err){
      Collectionss collectionss = new Collectionss();
      collectionss.collectionss = [];
      return collectionss;
    }
  }

  static Collectionss parsePhotos(String responseBody){
    final parsed = json.decode(responseBody)['collections'].cast<Map<String, dynamic>>();
    List<Collections> categories = parsed.map<Collections> ((json) => Collections.fromJson(json)).toList();
    Collectionss a = new Collectionss();
    a.collectionss = categories;
    return a;
  }
}