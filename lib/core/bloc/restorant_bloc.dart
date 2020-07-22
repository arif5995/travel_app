import 'package:geolocator/geolocator.dart';
import 'package:rxdart/rxdart.dart';
import 'package:travelapp/core/model/restorant/RestorantResponse.dart';
import 'package:travelapp/core/repositories/restorant_repo.dart';
import 'dart:async';

class RestorantBloc {
  final RestorantRepo _restorantRepo = RestorantRepo();
  final _restorant = BehaviorSubject<List<RestaurantElement>>();

  Stream<List<RestaurantElement>> get restorant => _restorant.stream;

  Function(List<RestaurantElement>) get changeRestorant => _restorant.sink.add;

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
        _restorant.sink.add(value);
      });
    }
  }

}
