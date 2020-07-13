// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'collectionss.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Collectionss _$CollectionssFromJson(Map<String, dynamic> json) {
  return Collectionss()
    ..collectionss = (json['collectionss'] as List)
        ?.map((e) =>
            e == null ? null : Collections.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$CollectionssToJson(Collectionss instance) =>
    <String, dynamic>{
      'collectionss': instance.collectionss,
    };
