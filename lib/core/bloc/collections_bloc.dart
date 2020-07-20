import 'dart:async';

import 'package:geolocator/geolocator.dart';
import 'package:rxdart/rxdart.dart';
import 'package:travelapp/core/model/collection/CollectionResponse.dart';
import 'package:travelapp/core/repositories/collection_repo.dart';

abstract class CollectionState{}
class CollectionList extends CollectionState{
  final List<CollectionElement> collection;

  CollectionList({this.collection});
}

class CollectionEvent{
  final String text;

  CollectionEvent({this.text});
}

class CollectionBlocs {
  final CollectionRepo repository = CollectionRepo();

  //stream to map
  final BehaviorSubject<CollectionEvent> _eventControllerCollection = BehaviorSubject<CollectionEvent>();
  StreamSink<CollectionEvent> get eventSinkCollection => _eventControllerCollection.sink;

  //stream to state
  final BehaviorSubject<CollectionState> _stateControllerCollection = BehaviorSubject<CollectionState>();
  StreamSink<CollectionState> get _stateSinkCollection => _stateControllerCollection.sink;
  Stream<CollectionState> get stateStream => _stateControllerCollection.stream;

  void _mapEventToState(CollectionEvent event) async{
    final _position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    List<CollectionElement> data = [];
    List<CollectionElement> data1 = [];
    data.clear();
    if (event.text == null){
      try{
        data = await repository.getCollections(lat: _position.latitude, lon: _position.longitude );
        print("lat : ${_position.latitude}");
        print("lat : ${_position.longitude}");
        _stateSinkCollection.add(CollectionList(collection: data));
        print("data : $data");
      }catch(e){
        print("error $e");
      }
    } else {
      try{
        data = await repository.getCollections(lat: _position.latitude, lon: _position.longitude);
        data.forEach((element) {
          if (element.collection.title.contains(event.text)) {
            data1.add(element);
          }
        });
        _stateControllerCollection.sink.add(CollectionList(collection: data1));


//        repository.getCollections().then((value) {
//          value.forEach((element) {
//            value.clear();
//            if (element.collection.title.contains(event.text))
//              value.add(element);
//          });
//          _stateSinkCollection.add(CollectionList(collection: value));
//          print("dataa: $value");
//        });

      }catch(e){
        print("error1 $e");
      }
    }
  }

  CollectionBlocs(){
    _eventControllerCollection.stream.listen(_mapEventToState);
  }

  void dispose(){
    _eventControllerCollection.close();
    _stateControllerCollection.close();
  }

  void add(CollectionEvent event){
    eventSinkCollection.add(event);
  }
}
