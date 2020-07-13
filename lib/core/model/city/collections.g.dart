// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'collections.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Collections _$CollectionsFromJson(Map<String, dynamic> json) {
  return Collections()
    ..collection = json['collection'] == null
        ? null
        : Collection.fromJson(json['collection'] as Map<String, dynamic>);
}

Map<String, dynamic> _$CollectionsToJson(Collections instance) =>
    <String, dynamic>{
      'collection': instance.collection,
    };

Collection _$CollectionFromJson(Map<String, dynamic> json) {
  return Collection()
    ..collectionId = json['collection_id'] as int
    ..resCount = json['res_count'] as int
    ..imageUrl = json['image_url'] as String
    ..url = json['url'] as String
    ..title = json['title'] as String
    ..description = json['description'] as String
    ..shareUrl = json['share_url'] as String;
}

Map<String, dynamic> _$CollectionToJson(Collection instance) =>
    <String, dynamic>{
      'collection_id': instance.collectionId,
      'res_count': instance.resCount,
      'image_url': instance.imageUrl,
      'url': instance.url,
      'title': instance.title,
      'description': instance.description,
      'share_url': instance.shareUrl,
    };
