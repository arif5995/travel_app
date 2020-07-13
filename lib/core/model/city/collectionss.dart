import 'package:json_annotation/json_annotation.dart';
import 'collections.dart';

part 'collectionss.g.dart';

@JsonSerializable()
class Collectionss {
      Collectionss();

  List<Collections> collectionss;

  factory Collectionss.fromJson(Map<String,dynamic> json) => _$CollectionssFromJson(json);
  Map<String, dynamic> toJson() => _$CollectionssToJson(this);
}
