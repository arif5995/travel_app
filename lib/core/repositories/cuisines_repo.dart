import 'package:dio/dio.dart';
import 'package:travelapp/core/config/end_pont.dart';
import 'package:travelapp/core/model/cuisines/CuisinesResponse.dart';


class CuisinesRepo {
  Dio dio = Dio();

  Future<List<CuisineElement>> getCuisines(
      {double lat, double lon}) async {
    //"${EndPoint.collections}city_id=1&lat=$lat&lon=$lon&count=40",
    try {
      final response = await dio.get(
        "${EndPoint.cuisines}&lat=$lat&lon=$lon&count=40",
        options: Options(headers: {"user-key": EndPoint.userKey}),
      );
      print("masuk");
      print(response.statusCode);
      print("lat : $lat");
      print("lat : $lon");
      if (200 == response.statusCode && response.data != null) { //! cek success error dan cek daa response
        CuisinesResponse data = CuisinesResponse.fromJson(response.data);
        List<CuisineElement> cuisines  = data.cuisines;
        print(cuisines.length);
        return cuisines;
      } else {
        print("Gagal");
      }
    } catch (e) {
      print("Gagal $e");
      print("lat : $lat");
      print("lat : $lon");
    }
  }
}
