

import 'package:dio/dio.dart';
import 'package:travelapp/core/model/category/catagoryResponse.dart';

class CategoryRepo {
  Dio dio = Dio();

  Future<List<Category>> getCategory() async {
    try {
      final response = await dio.get(
          "https://developers.zomato.com/api/v2.1/categories",
          options: Options(
              headers: {
                "user-key": "cfd175d769fd9f8f63071f7b75d77a8d"
              }
          )
      );
      print("masuk");
      print(response.statusCode);
      if (200 == response.statusCode){
        CatagoryResponse catagoryResponse = CatagoryResponse.fromJson(response.data);
        List<Category> category = catagoryResponse.categories;
        print(category.length);
        return category;
      } else {
        print("Gagal");
      }
    }catch (e) {
      print("Gagal $e");
    }

  }

}