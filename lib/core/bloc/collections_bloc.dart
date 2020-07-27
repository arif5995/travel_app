import 'dart:async';

import 'package:geolocator/geolocator.dart';
import 'package:rxdart/rxdart.dart';
import 'package:travelapp/core/model/collection/CollectionResponse.dart';
import 'package:travelapp/core/repositories/collection_repo.dart';

abstract class CollectionState {}

class CollectionList extends CollectionState {
  final List<CollectionElement> collection;
  CollectionList({this.collection});
}

class CollectionError extends CollectionState {
  //! state error collection
  final String errorMessage;
  CollectionError({this.errorMessage});
}

class CollectionEvent {
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

  Function(CollectionState) get changeCollectionState => _stateControllerCollection.sink.add; //! add function to change state

  void _mapEventToState(CollectionEvent event) async {
//    final _position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
//    lat: _position.latitude, lon: _position.longitude
    List<CollectionElement> data = [];
    List<CollectionElement> data1 = [];
    if (event.text == null) {
      try {
        data.clear();
        data = await repository.getCollections(lat: -6.229728, lon: 106.6894312);

        print("data : $data");
        if (data != null) { //! cek data kosong atau tidak
          changeCollectionState(CollectionList(collection: data)); //! update state to list collection
        } else {
          changeCollectionState(CollectionError(errorMessage: 'Data Kosong')); //! update state to empty list
        }
      } catch (e) {
        print("error $e");
        changeCollectionState(CollectionError(errorMessage: e.toString())); //! update state to error collection
      }
    } else {
      try {
        data1.clear();
        data = await repository.getCollections(lat: -6.229728, lon: 106.6894312);
        data.forEach((element) {
          if (element.collection.title
              .toUpperCase()
              .contains(event.text.toUpperCase())) data1.add(element);
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

      } catch (e) {
        print("error1 $e");
      }
    }
  }

  CollectionBlocs() {
    _eventControllerCollection.stream.listen(_mapEventToState);
  }

  void dispose() {
    _eventControllerCollection.close();
    _stateControllerCollection.close();
  }

  void add(CollectionEvent event) {
    eventSinkCollection.add(event);
  }
}
