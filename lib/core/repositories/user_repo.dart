import 'package:dio/dio.dart';
import 'package:travelapp/core/model/user/UserResponse.dart';

class UserRepo {
  Dio dio = Dio();
  //https://reqres.in/api/users/2
  Future <UserResponse> getUser() async {
    try {
      final response = await dio.get(
        "https://reqres.in/api/users/2"
      );
      print("masuk");
      print(response.statusCode);
      if (200 == response.statusCode){
        UserResponse userResponse = UserResponse.fromJson(response.data);
        return userResponse;
      } else {
        print("Gagal");
      }

    }catch (e){
      print("Gagal $e");
    }
  }
}