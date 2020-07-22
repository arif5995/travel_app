import 'dart:convert';

RestorantResponse restorantResponseFromJson(String str) => RestorantResponse.fromJson(json.decode(str));

String restorantResponseToJson(RestorantResponse data) => json.encode(data.toJson());

class RestorantResponse {
  RestorantResponse({
    this.resultsFound,
    this.resultsStart,
    this.resultsShown,
    this.restaurants,
  });

  int resultsFound;
  int resultsStart;
  int resultsShown;
  List<RestaurantElement> restaurants;

  factory RestorantResponse.fromJson(Map<String, dynamic> json) => RestorantResponse(
    resultsFound: json["results_found"],
    resultsStart: json["results_start"],
    resultsShown: json["results_shown"],
    restaurants: List<RestaurantElement>.from(json["restaurants"].map((x) => RestaurantElement.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "results_found": resultsFound,
    "results_start": resultsStart,
    "results_shown": resultsShown,
    "restaurants": List<dynamic>.from(restaurants.map((x) => x.toJson())),
  };
}

class RestaurantElement {
  RestaurantElement({
    this.restaurant,
  });

  RestaurantRestaurant restaurant;

  factory RestaurantElement.fromJson(Map<String, dynamic> json) => RestaurantElement(
    restaurant: RestaurantRestaurant.fromJson(json["restaurant"]),
  );

  Map<String, dynamic> toJson() => {
    "restaurant": restaurant.toJson(),
  };
}

class RestaurantRestaurant {
  RestaurantRestaurant({
    this.r,
    this.apikey,
    this.id,
    this.name,
    this.url,
    this.location,
    this.switchToOrderMenu,
    this.cuisines,
    this.timings,
    this.averageCostForTwo,
    this.priceRange,
    this.currency,
    this.highlights,
    this.offers,
    this.opentableSupport,
    this.isZomatoBookRes,
    this.mezzoProvider,
    this.isBookFormWebView,
    this.bookFormWebViewUrl,
    this.bookAgainUrl,
    this.thumb,
    this.userRating,
    this.allReviewsCount,
    this.photosUrl,
    this.photoCount,
    this.menuUrl,
    this.featuredImage,
    this.hasOnlineDelivery,
    this.isDeliveringNow,
    this.storeType,
    this.includeBogoOffers,
    this.deeplink,
    this.isTableReservationSupported,
    this.hasTableBooking,
    this.eventsUrl,
    this.phoneNumbers,
    this.allReviews,
    this.establishment,
    this.establishmentTypes,
  });

  R r;
  Apikey apikey;
  String id;
  String name;
  String url;
  Location location;
  int switchToOrderMenu;
  String cuisines;
  String timings;
  int averageCostForTwo;
  int priceRange;
  Currency currency;
  List<String> highlights;
  List<dynamic> offers;
  int opentableSupport;
  int isZomatoBookRes;
  MezzoProvider mezzoProvider;
  int isBookFormWebView;
  String bookFormWebViewUrl;
  String bookAgainUrl;
  String thumb;
  UserRating userRating;
  int allReviewsCount;
  String photosUrl;
  int photoCount;
  String menuUrl;
  String featuredImage;
  int hasOnlineDelivery;
  int isDeliveringNow;
  String storeType;
  bool includeBogoOffers;
  String deeplink;
  int isTableReservationSupported;
  int hasTableBooking;
  String eventsUrl;
  String phoneNumbers;
  AllReviews allReviews;
  List<String> establishment;
  List<dynamic> establishmentTypes;

  factory RestaurantRestaurant.fromJson(Map<String, dynamic> json) => RestaurantRestaurant(
    r: R.fromJson(json["R"]),
    apikey: apikeyValues.map[json["apikey"]],
    id: json["id"],
    name: json["name"],
    url: json["url"],
    location: Location.fromJson(json["location"]),
    switchToOrderMenu: json["switch_to_order_menu"],
    cuisines: json["cuisines"],
    timings: json["timings"],
    averageCostForTwo: json["average_cost_for_two"],
    priceRange: json["price_range"],
    currency: currencyValues.map[json["currency"]],
    highlights: List<String>.from(json["highlights"].map((x) => x)),
    offers: List<dynamic>.from(json["offers"].map((x) => x)),
    opentableSupport: json["opentable_support"],
    isZomatoBookRes: json["is_zomato_book_res"],
    mezzoProvider: mezzoProviderValues.map[json["mezzo_provider"]],
    isBookFormWebView: json["is_book_form_web_view"],
    bookFormWebViewUrl: json["book_form_web_view_url"],
    bookAgainUrl: json["book_again_url"],
    thumb: json["thumb"],
    userRating: UserRating.fromJson(json["user_rating"]),
    allReviewsCount: json["all_reviews_count"],
    photosUrl: json["photos_url"],
    photoCount: json["photo_count"],
    menuUrl: json["menu_url"],
    featuredImage: json["featured_image"],
    hasOnlineDelivery: json["has_online_delivery"],
    isDeliveringNow: json["is_delivering_now"],
    storeType: json["store_type"],
    includeBogoOffers: json["include_bogo_offers"],
    deeplink: json["deeplink"],
    isTableReservationSupported: json["is_table_reservation_supported"],
    hasTableBooking: json["has_table_booking"],
    eventsUrl: json["events_url"],
    phoneNumbers: json["phone_numbers"],
    allReviews: AllReviews.fromJson(json["all_reviews"]),
    establishment: List<String>.from(json["establishment"].map((x) => x)),
    establishmentTypes: List<dynamic>.from(json["establishment_types"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "R": r.toJson(),
    "apikey": apikeyValues.reverse[apikey],
    "id": id,
    "name": name,
    "url": url,
    "location": location.toJson(),
    "switch_to_order_menu": switchToOrderMenu,
    "cuisines": cuisines,
    "timings": timings,
    "average_cost_for_two": averageCostForTwo,
    "price_range": priceRange,
    "currency": currencyValues.reverse[currency],
    "highlights": List<dynamic>.from(highlights.map((x) => x)),
    "offers": List<dynamic>.from(offers.map((x) => x)),
    "opentable_support": opentableSupport,
    "is_zomato_book_res": isZomatoBookRes,
    "mezzo_provider": mezzoProviderValues.reverse[mezzoProvider],
    "is_book_form_web_view": isBookFormWebView,
    "book_form_web_view_url": bookFormWebViewUrl,
    "book_again_url": bookAgainUrl,
    "thumb": thumb,
    "user_rating": userRating.toJson(),
    "all_reviews_count": allReviewsCount,
    "photos_url": photosUrl,
    "photo_count": photoCount,
    "menu_url": menuUrl,
    "featured_image": featuredImage,
    "has_online_delivery": hasOnlineDelivery,
    "is_delivering_now": isDeliveringNow,
    "store_type": storeType,
    "include_bogo_offers": includeBogoOffers,
    "deeplink": deeplink,
    "is_table_reservation_supported": isTableReservationSupported,
    "has_table_booking": hasTableBooking,
    "events_url": eventsUrl,
    "phone_numbers": phoneNumbers,
    "all_reviews": allReviews.toJson(),
    "establishment": List<dynamic>.from(establishment.map((x) => x)),
    "establishment_types": List<dynamic>.from(establishmentTypes.map((x) => x)),
  };
}

class AllReviews {
  AllReviews({
    this.reviews,
  });

  List<Review> reviews;

  factory AllReviews.fromJson(Map<String, dynamic> json) => AllReviews(
    reviews: List<Review>.from(json["reviews"].map((x) => Review.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "reviews": List<dynamic>.from(reviews.map((x) => x.toJson())),
  };
}

class Review {
  Review({
    this.review,
  });

  List<dynamic> review;

  factory Review.fromJson(Map<String, dynamic> json) => Review(
    review: List<dynamic>.from(json["review"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "review": List<dynamic>.from(review.map((x) => x)),
  };
}

enum Apikey { CFD175_D769_FD9_F8_F63071_F7_B75_D77_A8_D }

final apikeyValues = EnumValues({
  "cfd175d769fd9f8f63071f7b75d77a8d": Apikey.CFD175_D769_FD9_F8_F63071_F7_B75_D77_A8_D
});

enum Currency { EMPTY }

final currencyValues = EnumValues({
  "\u0024": Currency.EMPTY
});

class Location {
  Location({
    this.address,
    this.locality,
    this.city,
    this.cityId,
    this.latitude,
    this.longitude,
    this.zipcode,
    this.countryId,
    this.localityVerbose,
  });

  String address;
  Ity locality;
  Ity city;
  int cityId;
  String latitude;
  String longitude;
  String zipcode;
  int countryId;
  LocalityVerbose localityVerbose;

  factory Location.fromJson(Map<String, dynamic> json) => Location(
    address: json["address"],
    locality: ityValues.map[json["locality"]],
    city: ityValues.map[json["city"]],
    cityId: json["city_id"],
    latitude: json["latitude"],
    longitude: json["longitude"],
    zipcode: json["zipcode"],
    countryId: json["country_id"],
    localityVerbose: localityVerboseValues.map[json["locality_verbose"]],
  );

  Map<String, dynamic> toJson() => {
    "address": address,
    "locality": ityValues.reverse[locality],
    "city": ityValues.reverse[city],
    "city_id": cityId,
    "latitude": latitude,
    "longitude": longitude,
    "zipcode": zipcode,
    "country_id": countryId,
    "locality_verbose": localityVerboseValues.reverse[localityVerbose],
  };
}

enum Ity { CUPERTINO, VALLCO_MALL, THE_OAKS_SHOPPING_CENTER }

final ityValues = EnumValues({
  "Cupertino": Ity.CUPERTINO,
  "The Oaks Shopping Center": Ity.THE_OAKS_SHOPPING_CENTER,
  "Vallco Mall": Ity.VALLCO_MALL
});

enum LocalityVerbose { CUPERTINO_CUPERTINO, VALLCO_MALL_CUPERTINO, THE_OAKS_SHOPPING_CENTER_CUPERTINO }

final localityVerboseValues = EnumValues({
  "Cupertino, Cupertino": LocalityVerbose.CUPERTINO_CUPERTINO,
  "The Oaks Shopping Center, Cupertino": LocalityVerbose.THE_OAKS_SHOPPING_CENTER_CUPERTINO,
  "Vallco Mall, Cupertino": LocalityVerbose.VALLCO_MALL_CUPERTINO
});

enum MezzoProvider { OTHER }

final mezzoProviderValues = EnumValues({
  "OTHER": MezzoProvider.OTHER
});

class R {
  R({
    this.hasMenuStatus,
    this.resId,
    this.isGroceryStore,
  });

  HasMenuStatus hasMenuStatus;
  int resId;
  bool isGroceryStore;

  factory R.fromJson(Map<String, dynamic> json) => R(
    hasMenuStatus: HasMenuStatus.fromJson(json["has_menu_status"]),
    resId: json["res_id"],
    isGroceryStore: json["is_grocery_store"],
  );

  Map<String, dynamic> toJson() => {
    "has_menu_status": hasMenuStatus.toJson(),
    "res_id": resId,
    "is_grocery_store": isGroceryStore,
  };
}

class HasMenuStatus {
  HasMenuStatus({
    this.delivery,
    this.takeaway,
  });

  int delivery;
  int takeaway;

  factory HasMenuStatus.fromJson(Map<String, dynamic> json) => HasMenuStatus(
    delivery: json["delivery"],
    takeaway: json["takeaway"],
  );

  Map<String, dynamic> toJson() => {
    "delivery": delivery,
    "takeaway": takeaway,
  };
}

class UserRating {
  UserRating({
    this.aggregateRating,
    this.ratingText,
    this.ratingColor,
    this.ratingObj,
    this.votes,
  });

  String aggregateRating;
  RatingText ratingText;
  RatingColor ratingColor;
  RatingObj ratingObj;
  int votes;

  factory UserRating.fromJson(Map<String, dynamic> json) => UserRating(
    aggregateRating: json["aggregate_rating"],
    ratingText: ratingTextValues.map[json["rating_text"]],
    ratingColor: ratingColorValues.map[json["rating_color"]],
    ratingObj: RatingObj.fromJson(json["rating_obj"]),
    votes: json["votes"],
  );

  Map<String, dynamic> toJson() => {
    "aggregate_rating": aggregateRating,
    "rating_text": ratingTextValues.reverse[ratingText],
    "rating_color": ratingColorValues.reverse[ratingColor],
    "rating_obj": ratingObj.toJson(),
    "votes": votes,
  };
}

enum RatingColor { THE_5_BA829, THE_9_ACD32, CDD614 }

final ratingColorValues = EnumValues({
  "CDD614": RatingColor.CDD614,
  "5BA829": RatingColor.THE_5_BA829,
  "9ACD32": RatingColor.THE_9_ACD32
});

class RatingObj {
  RatingObj({
    this.title,
    this.bgColor,
  });

  Title title;
  BgColor bgColor;

  factory RatingObj.fromJson(Map<String, dynamic> json) => RatingObj(
    title: Title.fromJson(json["title"]),
    bgColor: BgColor.fromJson(json["bg_color"]),
  );

  Map<String, dynamic> toJson() => {
    "title": title.toJson(),
    "bg_color": bgColor.toJson(),
  };
}

class BgColor {
  BgColor({
    this.type,
    this.tint,
  });

  Type type;
  String tint;

  factory BgColor.fromJson(Map<String, dynamic> json) => BgColor(
    type: typeValues.map[json["type"]],
    tint: json["tint"],
  );

  Map<String, dynamic> toJson() => {
    "type": typeValues.reverse[type],
    "tint": tint,
  };
}

enum Type { LIME, YELLOW }

final typeValues = EnumValues({
  "lime": Type.LIME,
  "yellow": Type.YELLOW
});

class Title {
  Title({
    this.text,
  });

  String text;

  factory Title.fromJson(Map<String, dynamic> json) => Title(
    text: json["text"],
  );

  Map<String, dynamic> toJson() => {
    "text": text,
  };
}

enum RatingText { VERY_GOOD, GOOD, AVERAGE }

final ratingTextValues = EnumValues({
  "Average": RatingText.AVERAGE,
  "Good": RatingText.GOOD,
  "Very Good": RatingText.VERY_GOOD
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
