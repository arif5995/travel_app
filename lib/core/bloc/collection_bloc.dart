import 'package:rxdart/rxdart.dart';
import 'package:travelapp/core/model/collection/CollectionResponse.dart';
import 'package:travelapp/core/repositories/collection_repo.dart';

class CollectionBloc {
 final CollectionRepo repository = CollectionRepo();

  final _collections = BehaviorSubject<List<CollectionElement>>();

 //Get Data
  Stream<List<CollectionElement>> get collections => _collections.stream;

 //Set Data
 Function (List<CollectionElement>) get  changeCities => _collections.sink.add;

 dispose(){
   _collections.close();
 }

 // ignore: missing_return
 Future <List<CollectionElement>> fetchCollection() async {
    repository.getCollections().then((value) {
      print("Result : ${value.length}");
      _collections.sink.add(value);
    }).catchError((err) {
      print("Error = $err");
    });  
 }
}

final blocCollection = CollectionBloc();