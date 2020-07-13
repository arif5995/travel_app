enum DataState {
  FIRST_LOAD, // when fetch data from api first time
  FIRST_LOAD_WITH_INIT_DATA, // when fetch data from api with local data
  LOADED, // fetch data success
  LOAD_MORE, // when load more data
  LOADED_ALL, // data loaded all
  ERROR_FIRST_LOAD, // error first load
  ERROR_LOAD_MORE, // error load more
}

class CityState<T> {
  DataState state;
  List<T> data;
  int page;

  CityState({this.state, this.data, this.page});

  CityState.init(){
    page = 0;
    data = <T>[];
    state = DataState.FIRST_LOAD;
  }

  CityState.initWithData(this.data){
    page = 0;
    state = DataState.FIRST_LOAD_WITH_INIT_DATA;
  }

  CityState.firstLoadSuccess(this.data) {
    page = 0;
    state = DataState.LOADED;
  }

  CityState.firstLoadError() {
    page = 0;
    data = <T>[];
    state = DataState.ERROR_FIRST_LOAD;
  }

  CityState.loadMore(this.data, this.page) {
    state = DataState.LOAD_MORE;
  }

  CityState.loadMoreSuccess(this.data, this.page) {
    state = DataState.LOADED;
  }

  CityState.loadMoreError(this.data, this.page) {
    state = DataState.ERROR_LOAD_MORE;
  }

  CityState.loadedAll(this.data, this.page) {
    state = DataState.LOADED_ALL;
  }

}