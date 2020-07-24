import 'package:rxdart/rxdart.dart';
import 'package:travelapp/core/model/category/catagoryResponse.dart';
import 'package:travelapp/core/repositories/category_repo.dart';

abstract class StateCategory {}

class StateCategoryError extends StateCategory {
  final String error;

  StateCategoryError(this.error);
}

class StateCategorySuccess extends StateCategory {
  final List<Category> list;

  StateCategorySuccess(this.list);
}

class CategoryBloc {
  final CategoryRepo repoCategory = CategoryRepo();
  final _category = BehaviorSubject<StateCategory>();

  //Get Data
  Stream<StateCategory> get category => _category.stream;

  //Set Data
  Function (StateCategory) get  changeCategory => _category.sink.add;

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
       if (value != null){
         changeCategory(StateCategorySuccess(value));
       } else {
         changeCategory(StateCategoryError("Daata Kosong"));
       }
     });
   }
  }
}

final blocCategory = CategoryBloc();