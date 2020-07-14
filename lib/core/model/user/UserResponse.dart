// To parse this JSON data, do
//
//     final userResponse = userResponseFromJson(jsonString);

import 'dart:convert';

UserResponse userResponseFromJson(String str) => UserResponse.fromJson(json.decode(str));

String userResponseToJson(UserResponse data) => json.encode(data.toJson());

class UserResponse {
  UserResponse({
    this.data,
    this.ad,
  });

  Data data;
  Ad ad;

  factory UserResponse.fromJson(Map<String, dynamic> json) => UserResponse(
    data: Data.fromJson(json["data"]),
    ad: Ad.fromJson(json["ad"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data.toJson(),
    "ad": ad.toJson(),
  };
}

class Ad {
  Ad({
    this.company,
    this.url,
    this.text,
  });

  String company;
  String url;
  String text;

  factory Ad.fromJson(Map<String, dynamic> json) => Ad(
    company: json["company"],
    url: json["url"],
    text: json["text"],
  );

  Map<String, dynamic> toJson() => {
    "company": company,
    "url": url,
    "text": text,
  };
}

class Data {
  Data({
    this.id,
    this.email,
    this.firstName,
    this.lastName,
    this.avatar,
  });

  int id;
  String email;
  String firstName;
  String lastName;
  String avatar;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    email: json["email"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    avatar: json["avatar"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "email": email,
    "first_name": firstName,
    "last_name": lastName,
    "avatar": avatar,
  };
}
