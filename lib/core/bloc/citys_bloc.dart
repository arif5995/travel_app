import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'package:travelapp/core/model/citys_model.dart';
import 'package:travelapp/core/repositories/cities_repo.dart';

class CitysBloc {
 final CitiesRepo _citiesRepository = CitiesRepo();

  final _cities = BehaviorSubject<List<CollectionElement>>();

 //Get Data
  Stream<List<CollectionElement>> get cities => _cities.stream;

 //Set Data
 Function (List<CollectionElement>) get  changeCities => _cities.sink.add;

 dispose(){
   _cities.close();
 }

   Future <List<CollectionElement>> fetchCities() async {
   List<CollectionElement> city = await _citiesRepository.getAllDataCities();
   _cities.sink.add(city);
 }
}

final blocCity = CitysBloc();