import 'package:dio/dio.dart';
import 'package:travelapp/core/config/end_pont.dart';
import 'package:travelapp/core/model/restorant/RestorantResponse.dart';
import 'dart:async';

class RestorantRepo {
  Dio dio = Dio();
//  double  lat = -7.9941872;
//  double lon = 111.7962077;

  Future<List<RestaurantElement>> getRestorant({double  lat, double lon }) async {

    try {
      final response = await dio.get(
        "${EndPoint.restorant}lat=$lat&lon=$lon",
        options: Options(
            headers: {
              "user-key": EndPoint.userKey
            }
        ),
      );
      print("resto : ${response.data}");
      print("resto : ${response.statusCode}");
      print("lat1 : $lat");
      print("lat1 : $lon");
      if (200 == response.statusCode){
        RestorantResponse model = RestorantResponse.fromJson(response.data);
        List<RestaurantElement> collections = model.restaurants;
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