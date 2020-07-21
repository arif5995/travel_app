

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:travelapp/core/config/end_pont.dart';
import 'package:travelapp/core/model/collection/CollectionResponse.dart';
import 'dart:convert';

class CollectionRepo {
  Dio dio = Dio();
//  double  lat = -7.9941872;
//  double lon = 111.7962077;

  Future<List<CollectionElement>> getCollections({double  lat, double lon }) async {
    try {
      final response = await dio.get(
          "${EndPoint.collections}city_id=1&lat=$lat&lon=$lon&count=40",
          options: Options(
              headers: {
                "user-key": EndPoint.userKey
              }
          ),
      );
      print("masuk");
      print(response.statusCode);
      print("lat : $lat");
      print("lat : $lon");
      if (200 == response.statusCode){
        CollectionResponse model = CollectionResponse.fromJson(response.data);
        List<CollectionElement> collections = model.collections;
        print(collections.length);
        return collections;
      } else {
        print("Gagal");
      }
    }catch (e) {
      print("Gagal $e");
      print("lat : $lat");
      print("lat : $lon");
    }

  }

}