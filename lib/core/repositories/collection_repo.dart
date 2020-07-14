

import 'package:dio/dio.dart';
import 'package:travelapp/core/model/collection/CollectionResponse.dart';
import 'dart:convert';

class CollectionRepo {
  Dio dio = Dio();

  // ignore: missing_return
  Future<List<CollectionElement>> getCollections() async {
    try {
      final response = await dio.get(
          "https://developers.zomato.com/api/v2.1/collections?lat=-6.229728&lon=106.6894312",
          options: Options(
              headers: {
                "user-key": "cfd175d769fd9f8f63071f7b75d77a8d"
              }
          )
      );
      print("masuk");
      print(response.statusCode);
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
    }

  }

}