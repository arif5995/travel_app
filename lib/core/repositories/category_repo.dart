

import 'package:dio/dio.dart';
import 'package:travelapp/core/config/end_pont.dart';
import 'package:travelapp/core/model/category/catagoryResponse.dart';

class CategoryRepo {
  Dio dio = Dio();

  Future<List<Category>> getCategory() async {
    try {
      final response = await dio.get(
          EndPoint.category,
          options: Options(
              headers: {
                "user-key": EndPoint.userKey
              }
          )
      );
      print("masuk");
      print(response.statusCode);
      print("category : ${response.data}");
      if (200 == response.statusCode && response.data != null){
        CatagoryResponse catagoryResponse = CatagoryResponse.fromJson(response.data);
        List<Category> category = catagoryResponse.categories;
        print("category : ${category.length}");
        return category;
      } else {
        print("Gagal");
      }
    }catch (e) {
      print("Gagal $e");
    }

  }

}