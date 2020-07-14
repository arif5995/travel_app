import 'package:rxdart/rxdart.dart';
import 'package:travelapp/core/model/user/UserResponse.dart';
import 'package:travelapp/core/repositories/user_repo.dart';

class UserBloc {
  final UserRepo userRepo = UserRepo();

  final _user = BehaviorSubject <UserResponse>();

  //Get Data
  Stream <UserResponse> get user => _user.stream;
  //Set Data
  Function (UserResponse) get sinkUser => _user.sink.add;

  bool _isDisposed = false;
  dispose(){
    _user.close();
    _isDisposed =  true;
  }

  Future <UserResponse> fetchUser() async {
   if (_isDisposed){

   } else {
     UserResponse user = await userRepo.getUser();
     _user.sink.add(user);
   }
  }

}

final blocUser = UserBloc();