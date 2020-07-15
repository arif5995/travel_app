mixin URLs{
  static const String host ="https://developers.zomato.com/api/v2.1/";
  //https://developers.zomato.com/api/v2.1/collections?city_id=1&lat=0.0&lon=0.0&count=10
}


// constant for page limit & timeout
mixin AppLimit {
  static const int REQUEST_TIME_OUT = 30000;
  static const int ALBUM_PAGE_SIZE = 18;
  static const int POST_PAGE_SIZE =  100;
}