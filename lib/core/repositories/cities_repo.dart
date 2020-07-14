import 'dart:convert';
import 'dart:async';
import 'package:dio/dio.dart';
import 'package:travelapp/core/model/citys_model.dart';

class CitiesRepo {
  static Dio dio = Dio();

  @override
  Future<List<CollectionElement>> getAllDataCities() async {
    try {
      final response = await dio.get(
          "https://developers.zomato.com/api/v2.1/collections?city_id=1&lat=0.0&lon=0.0&count=10",
          options: Options(
              headers: {
                "user-key": "cfd175d769fd9f8f63071f7b75d77a8d"
              }
          )
      );
      print("masuk");
      print(response.statusCode);
      print(response.data);
      if (200 == response.statusCode){
        City city = City.fromJson(json.decode(response.data)["collection"]);
        List<CollectionElement> collections = city.collections;
        print(collections.length);
        return collections;
      } else {
        print("Gagal");
      }
    }catch (e) {
      print("Gagal ${e}");
    }

  }

}