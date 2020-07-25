// To parse this JSON data, do
//
//     final cuisinesResponse = cuisinesResponseFromJson(jsonString);

import 'dart:convert';

CuisinesResponse cuisinesResponseFromJson(String str) => CuisinesResponse.fromJson(json.decode(str));

String cuisinesResponseToJson(CuisinesResponse data) => json.encode(data.toJson());

class CuisinesResponse {
  CuisinesResponse({
    this.cuisines,
  });

  List<CuisineElement> cuisines;

  factory CuisinesResponse.fromJson(Map<String, dynamic> json) => CuisinesResponse(
    cuisines: List<CuisineElement>.from(json["cuisines"].map((x) => CuisineElement.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "cuisines": List<dynamic>.from(cuisines.map((x) => x.toJson())),
  };
}

class CuisineElement {
  CuisineElement({
    this.cuisine,
  });

  CuisineCuisine cuisine;

  factory CuisineElement.fromJson(Map<String, dynamic> json) => CuisineElement(
    cuisine: CuisineCuisine.fromJson(json["cuisine"]),
  );

  Map<String, dynamic> toJson() => {
    "cuisine": cuisine.toJson(),
  };
}

class CuisineCuisine {
  CuisineCuisine({
    this.cuisineId,
    this.cuisineName,
  });

  int cuisineId;
  String cuisineName;

  factory CuisineCuisine.fromJson(Map<String, dynamic> json) => CuisineCuisine(
    cuisineId: json["cuisine_id"],
    cuisineName: json["cuisine_name"],
  );

  Map<String, dynamic> toJson() => {
    "cuisine_id": cuisineId,
    "cuisine_name": cuisineName,
  };
}
