import 'package:rxdart/rxdart.dart';
import 'package:travelapp/core/model/category/catagoryResponse.dart';
import 'package:travelapp/core/repositories/category_repo.dart';

class CategoryBloc {
  final CategoryRepo repoCategory = CategoryRepo();
  final _category = BehaviorSubject<List<Category>>();

  //Get Data
  Stream<List<Category>> get category => _category.stream;

  //Set Data
  Function (List<Category>) get  changeCategory => _category.sink.add;

  bool _isDisposed = false;
  dispose(){
    _category.close();
    _isDisposed = true;
  }

  Future <List<Category>> fetchCategory() async {
   if (_isDisposed){

   } else {
     repoCategory.getCategory().then((value) {
       print("Result : ${value.length}");
       _category.sink.add(value);
     });
   }
  }
}

final blocCategory = CategoryBloc();