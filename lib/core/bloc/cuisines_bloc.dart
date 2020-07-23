import 'package:geolocator/geolocator.dart';
import 'package:rxdart/rxdart.dart';
import 'package:travelapp/core/model/cuisines/CuisinesResponse.dart';
import 'package:travelapp/core/repositories/cuisines_repo.dart';

abstract class StateCuisines{}
class StateCuisinesError  extends StateCuisines{
  final String error;

  StateCuisinesError(this.error);
}

class StateCuisinesSucces extends StateCuisines{
  final List<CuisineElement> list;

  StateCuisinesSucces(this.list);
}

class CuisinesBloc {
  final CuisinesRepo repoCuisines = CuisinesRepo();
  final _cuisines = BehaviorSubject<StateCuisines>();

  //Get Data
  Stream<StateCuisines> get cuisiness => _cuisines.stream;

  //Set Data
  Function (StateCuisines) get  changeCategory => _cuisines.sink.add;

  bool _isDisposed = false;
  dispose(){
    _cuisines.close();
    _isDisposed = true;
  }

  Future <List<CuisineElement>> fetchCuisines() async {
    if (_isDisposed){

    } else {
      final _position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      repoCuisines.getCuisines(lat: _position.latitude, lon: _position.longitude).then((value){
        if (value != null){
          changeCategory(StateCuisinesSucces(value));
        } else {
          changeCategory(StateCuisinesError("Data Kosong"));
        }
      });
    }
  }
}
