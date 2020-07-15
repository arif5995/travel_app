
import 'dart:convert';

CatagoryResponse catagoryResponseFromJson(String str) => CatagoryResponse.fromJson(json.decode(str));

String catagoryResponseToJson(CatagoryResponse data) => json.encode(data.toJson());

class CatagoryResponse {
  CatagoryResponse({
    this.categories,
  });

  List<Category> categories;

  factory CatagoryResponse.fromJson(Map<String, dynamic> json) => CatagoryResponse(
    categories: List<Category>.from(json["categories"].map((x) => Category.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
  };
}

class Category {
  Category({
    this.categories,
  });

  Categories categories;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    categories: Categories.fromJson(json["categories"]),
  );

  Map<String, dynamic> toJson() => {
    "categories": categories.toJson(),
  };
}

class Categories {
  Categories({
    this.id,
    this.name,
  });

  int id;
  String name;

  factory Categories.fromJson(Map<String, dynamic> json) => Categories(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}
