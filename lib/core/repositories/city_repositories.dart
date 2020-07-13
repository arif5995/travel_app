import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:travelapp/core/model/city/collections.dart';
import 'package:travelapp/core/model/city/collectionss.dart';

class CityRepo {
  static Dio dio = new Dio();
  static Future <Collectionss> getCityCollection() async {

    try{
      final response = await dio.get(
          "https://developers.zomato.com/api/v2.1/collections?city_id=1&lat=0.0&lon=0.0&count=10",
        options: Options(
          headers: {
            "user-key": "cfd175d769fd9f8f63071f7b75d77a8d"
          }
        )
      );
      print("masuk get");
      print(response.statusCode);
      print(response.data);
      if (200 == response.statusCode){
        Collectionss collectionss = parsePhotos(response.data);
        print("masuk");
        return collectionss;
      } else {
        print("gagal else");
        Collectionss collectionss = new Collectionss();
        collectionss.collectionss = [];
        return collectionss;
      }
    }catch (err){
      print("gagal");
      Collectionss collectionss = new Collectionss();
      collectionss.collectionss = [];
      return collectionss;
    }
  }
  static Collectionss parsePhotos(String responseBody) {
    final parsed = json.decode(responseBody)['collections'].cast<Map<String, dynamic>>();
    List<Collections> categories = parsed.map<Collections>((json) => Collections.fromJson(json)).toList();
    Collectionss a = new Collectionss();
    a.collectionss = categories;
    return a;
  }
}