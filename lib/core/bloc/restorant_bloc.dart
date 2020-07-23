import 'package:geolocator/geolocator.dart';
import 'package:rxdart/rxdart.dart';
import 'package:travelapp/core/model/restorant/RestorantResponse.dart';
import 'package:travelapp/core/repositories/restorant_repo.dart';
import 'dart:async';

abstract class RestorantState {}
class RestorantError extends RestorantState {
  final String error;

  RestorantError(this.error);
}

class RestorantSuccess extends RestorantState {
  final List<RestaurantElement> restorant;

  RestorantSuccess(this.restorant);
}

class RestorantBloc {
  final RestorantRepo _restorantRepo = RestorantRepo();
  final BehaviorSubject <RestorantState> _restorant = BehaviorSubject<RestorantState>();

  Stream<RestorantState> get restorant => _restorant.stream;

  Function(RestorantState) get changeRestorant => _restorant.sink.add;

  bool _isDisposed = false;

  dispose(){
    _restorant.close();
    _isDisposed = true;
  }

  Future <List<RestaurantElement>> fetchRestorant() async{
    final _position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    print("lat1 : ${_position.latitude}");
    print("lon1 :  ${_position.longitude}");
    if (_isDisposed){

    }else {
      _restorantRepo.getRestorant(
          lat: _position.latitude, lon: _position.longitude).then((value) {
        if (value != null){
          changeRestorant(RestorantSuccess(value));
        } else {
          changeRestorant(RestorantError("Data Kosong"));
        }

      });
    }
  }

}
