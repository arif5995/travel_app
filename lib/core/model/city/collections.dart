import 'package:json_annotation/json_annotation.dart';


part 'collections.g.dart';

@JsonSerializable()
class Collections {
      Collections();

  Collection collection;

  factory Collections.fromJson(Map<String,dynamic> json) => _$CollectionsFromJson(json);
  Map<String, dynamic> toJson() => _$CollectionsToJson(this);
}

@JsonSerializable()
class Collection {
      Collection();

  @JsonKey(name: 'collection_id') int collectionId;
  @JsonKey(name: 'res_count') int resCount;
  @JsonKey(name: 'image_url') String imageUrl;
  String url;
  String title;
  String description;
  @JsonKey(name: 'share_url') String shareUrl;

  factory Collection.fromJson(Map<String,dynamic> json) => _$CollectionFromJson(json);
  Map<String, dynamic> toJson() => _$CollectionToJson(this);
}
